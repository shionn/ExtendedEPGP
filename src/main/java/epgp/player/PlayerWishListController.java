package epgp.player;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import epgp.db.dao.ItemDao;
import epgp.db.dao.PlayerDao;
import epgp.db.dao.PlayerWhishDao;
import epgp.db.dbo.Item;
import epgp.db.dbo.LootAttribution;
import epgp.db.dbo.Player;
import epgp.db.dbo.PlayerClass;
import epgp.db.dbo.PlayerWish;

@Controller
public class PlayerWishListController {
	private static final int MAX_ITEM = 10;
	@Autowired
	private SqlSession session;
	@Autowired
	private PlayerFilterForm form;

	@RequestMapping(value = "/player/wish", method = RequestMethod.GET)
	public ModelAndView list(@RequestParam(defaultValue = "-1", name = "player") int playerId) {
		PlayerDao dao = session.getMapper(PlayerDao.class);
		ModelAndView view = new ModelAndView("player-wish") //
				.addObject("players", dao.listPlayers()) //
				.addObject("wishes", dao.listWishes(form))//
				.addObject("formFilter", form);
		if (playerId != -1) {
			Player player = readPlayer(playerId);
			view.addObject("player", player) //
					.addObject("items", readItems(player.getClazz())) //
					.addObject("attributions",
							Arrays.asList(LootAttribution.primary, LootAttribution.secondary));
		}
		return view;
	}

	@RequestMapping(value = "/player/wish", method = RequestMethod.POST)
	public ModelAndView update(@ModelAttribute("player") Player player) {
		PlayerWhishDao dao = session.getMapper(PlayerWhishDao.class);
		dao.deleteOldWish(player);
		for (PlayerWish wish : player.getWishes()) {
			if (wish.getItem().getId() != 0) {
				dao.update(player, wish);
			}
		}
		session.commit();
		return list(player.getId());
	}

	private Player readPlayer(int id) {
		Player player = session.getMapper(PlayerWhishDao.class).viewPlayer(id);
		while (player.getWishes().size() < MAX_ITEM) {
			PlayerWish wish = new PlayerWish();
			wish.setItem(noneItem());
			List<PlayerWish> wishes = new ArrayList<PlayerWish>(player.getWishes());
			wishes.add(wish);
			player.setWishes(wishes);
		}
		return player;
	}

	private List<Item> readItems(PlayerClass clazz) {
		List<Item> items = new ArrayList<>(session.getMapper(ItemDao.class).listForClassInRaid(clazz));
		items.add(0, noneItem());
		return items;
	}

	private Item noneItem() {
		Item item = new Item();
		item.setName("---");
		item.setId(0);
		return item;
	}

}
