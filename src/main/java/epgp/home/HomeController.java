package epgp.home;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.context.annotation.RequestScope;
import org.springframework.web.servlet.ModelAndView;

import epgp.db.dao.ItemDao;
import epgp.db.dbo.Item;
import epgp.db.dbo.RaidInstance;

/**
 * Code sous licence GPLv3 (http://www.gnu.org/licenses/gpl.html)
 *
 * @author <b>Shionn</b>, shionn@gmail.com <i>http://shionn.org</i><br>
 *         GCS d- s+:+ a+ C++ UL/M P L+ E--- W++ N K- w-- M+ t+ 5 X R+ !tv b+ D+ G- e+++ h+ r- y+
 */
@Controller()
@RequestScope
public class HomeController {

	@Autowired
	private SqlSession session;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		return "redirect:/armory";
	}

	@RequestMapping(value = "/info", method = RequestMethod.GET)
	public ModelAndView info() {
		List< List<Item>> itemss = new ArrayList<>();
		itemss.add(session.getMapper(ItemDao.class).listForInstance(RaidInstance.MC));
		itemss.add(session.getMapper(ItemDao.class).listForInstance(RaidInstance.Boss));
		return new ModelAndView("info") //
				.addObject("itemss", itemss);
	}

}
