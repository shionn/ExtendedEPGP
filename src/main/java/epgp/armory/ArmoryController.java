package epgp.armory;

import java.io.Serializable;
import java.util.Arrays;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import epgp.db.dao.ArmoryDao;
import epgp.db.dao.ItemDao;
import epgp.db.dao.PlayerDao;
import epgp.db.dbo.Item;
import epgp.db.dbo.ItemSlot;
import epgp.db.dbo.Player;
import epgp.db.dbo.PlayerClass;
import epgp.json.ItemJsonParser;

@Controller
public class ArmoryController implements Serializable {
	private static final List<List<ItemSlot>> SLOTS = Arrays.asList(Arrays.asList(ItemSlot.TwoHand),
			Arrays.asList(ItemSlot.MainHand), //
			Arrays.asList(ItemSlot.OffHand, ItemSlot.HeldInOffhand, ItemSlot.Shield), //
			Arrays.asList(ItemSlot.Ranged, ItemSlot.Relic), //
			Arrays.asList(ItemSlot.Head), //
			Arrays.asList(ItemSlot.Neck), //
			Arrays.asList(ItemSlot.Shoulder), //
			Arrays.asList(ItemSlot.Back), //
			Arrays.asList(ItemSlot.Chest), //
			Arrays.asList(ItemSlot.Wrist), //
			Arrays.asList(ItemSlot.Hands), //
			Arrays.asList(ItemSlot.Waist), //
			Arrays.asList(ItemSlot.Legs), //
			Arrays.asList(ItemSlot.Feet), //
			Arrays.asList(ItemSlot.Finger), //
			Arrays.asList(ItemSlot.Trinket));

	private static final long serialVersionUID = 1L;

	@Autowired
	private SqlSession session;
	@Autowired
	private ArmoryForm form;

	@RequestMapping(value = "/armory", method = RequestMethod.GET)
	public ModelAndView list() {
		return new ModelAndView("armory") //
				.addObject("form", form) //
				.addObject("classes", PlayerClass.values()) //
				.addObject("slots", SLOTS) //
				.addObject("players", session.getMapper(PlayerDao.class).listAllPlayers())
				.addObject("armories", session.getMapper(ArmoryDao.class).list(form.getClasses()));
	}

	@RequestMapping(value = "/armory/toggle-class/{clazz}", method = RequestMethod.GET)
	public String filterRaid(@PathVariable("clazz") PlayerClass clazz) {
		form.toggleClass(clazz);
		return "redirect:/armory";
	}

	@RequestMapping(value = "/armory/add/{id}", method = RequestMethod.GET)
	public ModelAndView openAdd(@PathVariable("id") int id) {
		Player player = session.getMapper(PlayerDao.class).readOne(id);
		List<Item> items = session.getMapper(ItemDao.class)
				.listAvailableForClass(player.getClazz());
		return new ModelAndView("armory-add") //
				.addObject("player", player) //
				.addObject("items", items);
	}

	@Autowired
	private ItemJsonParser parser;

	@RequestMapping(value = "/armory/add/{player-id}", method = RequestMethod.POST)
	public String addToArmory(@PathVariable("player-id") int player,
			@RequestParam(name = "item-id", defaultValue = "0") int itemId,
			@RequestParam(name = "new-item-id", defaultValue = "0") int newItemId,
			RedirectAttributes attr) {
		if (newItemId != 0) {
			Item item = parser.get(newItemId);
			session.getMapper(ItemDao.class).create(item);
			item.getClasses().stream().forEach(clazz -> session.getMapper(ItemDao.class)
					.createItemAssignment(item.getId(), clazz));
			attr.addFlashAttribute("message", "Item added");
			session.getMapper(ArmoryDao.class).add(player, item.getId());
		} else if (itemId != 0) {
			session.getMapper(ArmoryDao.class).add(player, itemId);
		}
		session.commit();
		return "redirect:/armory";
	}

	//
	// @RequestMapping(value = "/armory/{player}/{item}", method = RequestMethod.GET)
	// public String toggle(@PathVariable("player") int player, @PathVariable("item") int item) {
	// ArmoryDao dao = session.getMapper(ArmoryDao.class);
	// if (dao.isPlayerStuff(player, item)) {
	// dao.removePlayerStuff(player, item);
	// } else {
	// dao.addPlayerStuff(player, item);
	// }
	// session.commit();
	// return "redirect:/armory";
	// }
	//
	// @RequestMapping(value = "/armory/all", method = RequestMethod.GET)
	// public String resetFilter() {
	// this.raid = null;
	// this.clazz = null;
	// return "redirect:/armory";
	// }
	//
	// @RequestMapping(value = "/armory/raid/{raid}", method = RequestMethod.GET)
	// public String filterRaid(@PathVariable("raid") RaidInstance raid) {
	// this.raid = raid;
	// return "redirect:/armory";
	// }

}
