package epgp.player;

import java.util.List;
import java.util.stream.Collectors;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import epgp.db.dao.PlayerHistoryDao;
import epgp.db.dbo.Player;
import epgp.db.dbo.Raid;

@Controller
public class PlayerHistoryController {

	@Autowired
	private SqlSession session;
	@Autowired
	private PlayerFilterForm form;

	@RequestMapping(value = "/player/history", method = RequestMethod.GET)
	public ModelAndView open() {
		List<Player> players = session.getMapper(PlayerHistoryDao.class).list(form);
		List<Raid> raids = players.stream().flatMap(p -> p.getHistories().stream())
				.map(h -> h.getRaid()).distinct()
				.sorted().collect(Collectors.toList());
		return new ModelAndView("player-history") //
				.addObject("formFilter", form) //
				.addObject("players", players) //
				.addObject("raids", raids);
	}

}
