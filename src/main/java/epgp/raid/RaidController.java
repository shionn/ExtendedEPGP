package epgp.raid;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.annotation.SessionScope;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import epgp.db.dao.ItemDao;
import epgp.db.dao.PlayerWhishDao;
import epgp.db.dao.RaidDao;
import epgp.db.dbo.Item;
import epgp.db.dbo.Loot;
import epgp.db.dbo.LootAttribution;
import epgp.db.dbo.Player;
import epgp.db.dbo.PlayerWish;
import epgp.db.dbo.Raid;
import epgp.db.dbo.RaidEntry;
import epgp.db.dbo.RaidInstance;
import epgp.db.dbo.SortOrder;

@Controller
@SessionScope
public class RaidController implements Serializable {
	private static final long serialVersionUID = -6557111787828849090L;

	@Autowired
	private SqlSession session;

	private int item = 0;

	private SortOrder order = SortOrder.clazz;


	@RequestMapping(value = "/raid", method = RequestMethod.GET)
	public ModelAndView list() {
		RaidDao dao = session.getMapper(RaidDao.class);
		List<Raid> raids = dao.listRunnings();
		for (Raid raid : raids) {
			raid.setEntries(dao.listEntry(raid.getId(), order));
		}
		List<Item> items = new ArrayList<>();
		if (!raids.isEmpty()) {
			items = session.getMapper(ItemDao.class).listForRaid(raids.get(0).getId());
		}
		List<PlayerWish> wishes = new ArrayList<>();
		List<Player> players = new ArrayList<>();
		if (item != 0) {
			wishes = session.getMapper(PlayerWhishDao.class).listForRaid(item,
					raids.get(0).getId());
			players = wishes.stream().map(w -> w.getPlayer()).collect(Collectors.toList());
		}
		return new ModelAndView("raid") //
				.addObject("raids", raids) //
				.addObject("items", items) //
				.addObject("wishes", wishes) //
				.addObject("players", players) //
				.addObject("instances", RaidInstance.values());
	}

	@RequestMapping(value = "/raid/add", method = RequestMethod.POST)
	public String createRaid(@ModelAttribute("raid") Raid raid, RedirectAttributes attr) {
		session.getMapper(RaidDao.class).create(raid);
		session.commit();
		return "redirect:/raid";
	}

	@CacheEvict(cacheNames = { "priority", "historic", "statistic" }, allEntries = true)
	@RequestMapping(value = "/raid/update", method = RequestMethod.POST)
	public String updateRaid(@ModelAttribute("raid") Raid raid, RedirectAttributes attr) {
		RaidDao dao = session.getMapper(RaidDao.class);
		dao.update(raid);
		session.commit();
		return "redirect:/raid";
	}

	@RequestMapping(value = "/raid/edit/{id}", method = RequestMethod.GET)
	public String startEdit(@ModelAttribute("id") int id) {
		RaidDao dao = session.getMapper(RaidDao.class);
		dao.startEdit(id);
		session.commit();
		return "redirect:/raid";
	}

	@RequestMapping(value = "/raid/edit/member/{id}", method = RequestMethod.GET)
	public ModelAndView editRaidMember(@PathVariable("id") int id) {
		RaidDao dao = session.getMapper(RaidDao.class);
		Raid raid = dao.read(id);
		raid.setEntries(dao.readEntries(id));
		return new ModelAndView("raid-member").addObject("raid", raid);
	}

	@RequestMapping(value = "/raid/edit/member/{id}", method = RequestMethod.POST)
	public String editRaidMember(@PathVariable("id") int id, @ModelAttribute("raid") Raid raid) {
		RaidDao dao = session.getMapper(RaidDao.class);
		dao.removeRaidEntry(id);
		for (RaidEntry e : raid.getEntries()) {
			if (e.isMember()) {
				dao.addMember(id, e.getPlayer().getId(), e.isBench(), e.isAbsent(), e.isQuit());
			}
		}
		session.commit();
		return "redirect:/raid";
	}

	@RequestMapping(value = "/raid/loot/{raid}/{player}", method = RequestMethod.GET)
	public ModelAndView editRaidLoot(@PathVariable("raid") int raid,
			@PathVariable("player") int player) {
		return new ModelAndView("raid-loot") //
				.addObject("raid", raid) //
				.addObject("player", player) //
				.addObject("attributions", LootAttribution.values()) //
				.addObject("items",
						session.getMapper(ItemDao.class).listForRaidAndPlayer(raid, player));
	}

	@RequestMapping(value = "/raid/loot/{raid}/{player}", method = RequestMethod.POST)
	public String addRaidLoot(@PathVariable("raid") int raid, //
			@PathVariable("player") int player, //
			@RequestParam("item") int item, //
			@RequestParam("attribution") LootAttribution attribution) {
		RaidDao dao = session.getMapper(RaidDao.class);
		dao.addLoot(raid, player, item, attribution);
		session.commit();
		return "redirect:/raid";
	}

	@RequestMapping(value = "/raid/loot/{raid}/{player}/{item}", method = RequestMethod.GET)
	public String rmRaidLoot(@PathVariable("raid") int raid, @PathVariable("player") int player,
			@PathVariable("item") int item) {
		session.getMapper(RaidDao.class).removeLoot(raid, player, item);
		session.commit();
		return "redirect:/raid";
	}


	@RequestMapping(value = "/raid/wish", method = RequestMethod.GET)
	public String viewItemWish(@RequestParam(name = "item") int itemId) {
		this.item = itemId;
		return "redirect:/raid";
	}

	@ResponseBody
	@RequestMapping(value = "/raid/rcloot/{raid}", method = RequestMethod.GET)
	public HttpEntity<String> csvRcLootCouncilExport(@PathVariable(name = "raid") int id) {
		StringBuilder export = new StringBuilder();
		RaidDao dao = session.getMapper(RaidDao.class);
		Raid raid = dao.read(id);
		for (RaidEntry e : dao.listEntry(id, order)) {
			for (Loot loot : e.getLoots()) {
				export.append(e.getPlayer().getName()).append(',') //
						.append(new SimpleDateFormat("dd/mm/yy").format(raid.getDate())).append(',') //
						.append(new SimpleDateFormat("hh:MM:ss").format(raid.getDate())).append(',') //
						.append(raid.getDate().getTime()).append(',') //
						.append(loot.getItem().getName()).append(',') //
						.append(loot.getItem().getId()).append(',') //
						.append(',') // item string
						.append(loot.getAttribution().rcLootName()).append(',') // response id
						.append(',') // vote
						.append(e.getPlayer().getClazz().name()).append(',') //
						.append(raid.getInstance().name()).append(',') //
						.append(loot.getItem().getBoss()).append(',') //
						.append(',') // difficulty id
						.append(',') // map id
						.append(',') // groupe size
						.append(',') // gear 1
						.append(',') // gear 2
						.append(',') // responseId
						.append(',') // isawardReason
						.append(',') // sub type
						.append(',') // equiploc
						.append(',') // note
						.append(',') // owner
						.append('\n');
			}
		}
		HttpHeaders header = new HttpHeaders();
		header.set(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=" + id + ".csv");
		return new HttpEntity<String>(export.toString(), header);
	}

}
