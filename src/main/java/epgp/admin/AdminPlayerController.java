package epgp.admin;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import epgp.db.dao.PlayerDao;
import epgp.db.dbo.Player;
import epgp.db.dbo.PlayerClass;

@Controller
public class AdminPlayerController {
	@Autowired
	private SqlSession session;

	// @CacheEvict(cacheNames = { "priority", "historic", "statistic" }, allEntries = true)
	@RequestMapping(value = "/admin/create-player", method = RequestMethod.POST)
	public String createPlayer(@RequestParam("pseudo") String pseudo,
			@RequestParam("class") PlayerClass clazz, RedirectAttributes attr) {
		Player player = new Player();
		player.setName(pseudo);
		player.setClazz(clazz);

		session.getMapper(PlayerDao.class).create(player);
		session.commit();
		attr.addFlashAttribute("message", "Personnage crée");
		return "redirect:/admin";
	}

	@RequestMapping(value = "/admin/edit-player", method = RequestMethod.POST)
	public ModelAndView openEditPlayer(@RequestParam(name = "id") int id) {
		PlayerDao dao = session.getMapper(PlayerDao.class);
		return new ModelAndView("edit-player") //
				.addObject("player", dao.readOne(id)) //
				.addObject("playerclasses", PlayerClass.values());
	}

	// @CacheEvict(cacheNames = { "priority", "historic", "statistic" }, allEntries = true)
	@RequestMapping(value = "/admin/edit-player/{id}", method = RequestMethod.POST)
	public String editPlayer(@PathVariable(name = "id") int id,
			@RequestParam(name = "class") PlayerClass clazz,
			@RequestParam(name = "name") String name,
			@RequestParam(name = "enable", defaultValue = "false") boolean enable) {
		PlayerDao dao = session.getMapper(PlayerDao.class);
		Player player = dao.readOne(id);
		player.setName(name);
		player.setClazz(clazz);
		player.setEnable(enable);
		dao.updatePlayer(player);
		session.commit();
		return "redirect:/admin";
	}

}
