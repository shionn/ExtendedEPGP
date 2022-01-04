package epgp.admin;

import java.util.Objects;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import epgp.EpgpComputer;
import epgp.db.dao.ItemDao;
import epgp.db.dbo.Item;
import epgp.db.dbo.ItemSlot;
import epgp.db.dbo.PlayerClass;
import epgp.db.dbo.RaidInstance;
import epgp.json.ItemJsonParser;

@Controller
public class AdminItemController {
	@Autowired
	private SqlSession session;
	@Autowired
	private ItemJsonParser parser;

	@RequestMapping(value = "/admin/create-item", method = RequestMethod.POST)
	public String createItem(@RequestParam(name = "id") int id, RedirectAttributes attr) {
		Item item = parser.get(id);
		ItemDao dao = session.getMapper(ItemDao.class);
		dao.create(item);
		item.getClasses().stream().forEach(clazz -> dao.createItemAssignment(item.getId(), clazz));
		attr.addFlashAttribute("message", "Item added");
		session.commit();
		return "redirect:/admin";
	}

	@RequestMapping(value = "/admin/edit-item", method = RequestMethod.POST)
	public ModelAndView openEditItem(@RequestParam(name = "id") int id) {
		Item item = session.getMapper(ItemDao.class).readOne(id);
		return new ModelAndView("edit-item").addObject("item", item) //
				.addObject("playerclasses", PlayerClass.values()) //
				.addObject("raids", RaidInstance.values()) //
				.addObject("slots", ItemSlot.values());
	}

	// @CacheEvict(cacheNames = { "priority", "historic", "statistic" }, allEntries = true)
	@RequestMapping(value = "/admin/edit-item/{id}", method = RequestMethod.POST)
	public String editItem(@ModelAttribute("item") Item item, @PathVariable("id") int id) {
		ItemDao dao = session.getMapper(ItemDao.class);
		item.setId(id);
		item.setPt(new EpgpComputer().computeGp(item.getIlvl(), item.getSlot(), item.getPtRatio()));
		dao.update(item);
		dao.deleteItemAssignment(item.getId());
		item.getClasses().stream().filter(Objects::nonNull)
				.forEach(clazz -> dao.createItemAssignment(item.getId(), clazz));
		session.commit();
		return "redirect:/admin";
	}

	// @RequestMapping(value = "/admin/edit-boss", method = RequestMethod.POST)
	// public String editBoss(@RequestParam(name = "bossname") String bossName,
	// @RequestParam(name = "newbossname") String newBossName) {
	// session.getMapper(ItemDao.class).renameBosses(bossName, newBossName);
	// session.commit();
	// return "redirect:/admin";
	// }

}
