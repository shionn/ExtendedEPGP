package epgp.player;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import epgp.db.dbo.PlayerClass;

@Controller
public class PlayerFilterController {
	@Autowired
	private PlayerFilterForm form;

	@RequestMapping(value = "/toggle-class/{clazz}", method = RequestMethod.GET)
	public String filterRaid(@PathVariable("clazz") PlayerClass clazz,
			@RequestHeader("referer") String referer) {
		form.toggleClass(clazz);
		return redirect(referer);
	}

	@RequestMapping(value = "/toggle-player/{id}", method = RequestMethod.GET)
	public String filterPlayer(@PathVariable("id") int player,
			@RequestHeader("referer") String referer) {
		form.togglePlayer(player);
		return redirect(referer);
	}

	private String redirect(String referer) {
		if (referer.indexOf("/armory") > 0) {
			return "redirect:/armory";
		}
		if (referer.indexOf("/player/statistic") > 0) {
			return "redirect:/player/statistic";
		}
		if (referer.indexOf("/player/wish") > 0) {
			return "redirect:/player/wish";
		}
		return "redirect:/";
	}


}
