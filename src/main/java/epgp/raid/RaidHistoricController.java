package epgp.raid;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import epgp.db.dao.RaidHistoricDao;


@Controller
public class RaidHistoricController {

	@Autowired
	private SqlSession session;

	// @Cacheable(cacheNames = "historic", keyGenerator = "MethodNameKeyGenerator")
	@RequestMapping(value = "/raid/historic", method = RequestMethod.GET)
	public ModelAndView raids() {
		RaidHistoricDao dao = session.getMapper(RaidHistoricDao.class);
		return new ModelAndView("raid-historic").addObject("raids", dao.listAll());
	}

}
