package epgp.admin;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import epgp.db.dao.ItemDao;
import epgp.db.dao.PlayerDao;
import epgp.db.dbo.PlayerClass;

@Controller
public class AdminController {
	@Autowired
	private SqlSession session;

	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public ModelAndView admin() {
		return new ModelAndView("admin") //
				.addObject("playerclasses", PlayerClass.values()) //
				// .addObject("raids", RaidInstance.values()) //
				// .addObject("slots", ItemSlot.values()) //
				.addObject("players", session.getMapper(PlayerDao.class).listAllPlayers())
				.addObject("items", session.getMapper(ItemDao.class).list())
		// .addObject("bosses", session.getMapper(ItemDao.class).listBosses())
		;
	}

	// @RequestMapping(value = "/admin/edit-boss", method = RequestMethod.POST)
	// public String editBoss(@RequestParam(name = "bossname") String bossName,
	// @RequestParam(name = "newbossname") String newBossName) {
	// session.getMapper(ItemDao.class).renameBosses(bossName, newBossName);
	// session.commit();
	// return "redirect:/admin";
	// }

}
