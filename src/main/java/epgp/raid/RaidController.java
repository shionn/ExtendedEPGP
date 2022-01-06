package epgp.raid;

import java.io.Serializable;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.annotation.SessionScope;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import epgp.db.dao.ItemDao;
import epgp.db.dao.RaidDao;
import epgp.db.dbo.LootAttribution;
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

	private SortOrder order = SortOrder.clazz;

	@RequestMapping(value = "/raid", method = RequestMethod.GET)
	public ModelAndView list() {
		RaidDao dao = session.getMapper(RaidDao.class);
		List<Raid> raids = dao.listRunnings();
		for (Raid raid : raids) {
			raid.setEntries(dao.listEntry(raid.getId(), order));
		}
		return new ModelAndView("raid") //
				.addObject("raids", raids) //
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
				dao.addMember(id, e.getPlayer().getId(), e.isBench(), e.isAbsent());
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

	// @RequestMapping(value = "/raid/sort/{order}", method = RequestMethod.GET)
	// public String orderBy(@PathVariable("order") SortOrder order) {
	// this.order = order;
	// return "redirect:/raid";
	// }
	//
	// @RequestMapping(value = "/raid/filterboss", method = RequestMethod.POST)
	// public String filterBoss(@RequestParam("boss") String boss) {
	// this.boss = boss;
	// return "redirect:/raid";
	// }

}
