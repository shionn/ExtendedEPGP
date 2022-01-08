package epgp.player;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import epgp.db.dao.PlayerStatisticDao;

@Controller
public class PlayerStatisticController {

	@Autowired
	private SqlSession session;

	@RequestMapping(value = "/player/statistic", method = RequestMethod.GET)
	public ModelAndView open() {
		return new ModelAndView("player-statistic").addObject("stats",
				session.getMapper(PlayerStatisticDao.class).list());
	}

}
