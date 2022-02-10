package epgp.player;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.context.annotation.SessionScope;

import epgp.db.dao.PlayerDao;
import epgp.db.dbo.Player;
import epgp.db.dbo.PlayerClass;

@Component
@SessionScope
public class PlayerFilterForm {

	private List<PlayerClass> classes = new ArrayList<>();
	private List<Integer> players = new ArrayList<>();
	private boolean inRaid;
	@Autowired
	private SqlSession session;

	public boolean isClassSelected(PlayerClass clazz) {
		return classes.contains(clazz);
	}

	public boolean isPlayerSelected(int player) {
		return players.contains(player);
	}

	public String getLinkColor(PlayerClass clazz) {
		return isClassSelected(clazz) ? "green" : "red";
	}

	public String getLinkColor(int player) {
		return isPlayerSelected(player) ? "green" : "red";
	}

	public String getInRaidLinkColor() {
		return inRaid ? "green" : "red";
	}

	public void toggleClass(PlayerClass clazz) {
		if (isClassSelected(clazz)) {
			classes.remove(clazz);
		} else {
			classes.add(clazz);
		}
	}

	public void togglePlayer(int player) {
		if (isPlayerSelected(player)) {
			players.remove(players.indexOf(player));
		} else {
			players.add(player);
		}
	}

	public List<PlayerClass> getAllClasses() {
		return Arrays.asList(PlayerClass.values());
	}

	public List<PlayerClass> getClasses() {
		return classes;
	}

	public List<Player> getAllPlayers() {
		return session.getMapper(PlayerDao.class).listPlayers();
	}

	public List<Integer> getPlayers() {
		return players;
	}

	public boolean isDisplayPlayerFilter() {
		return !classes.isEmpty();
	}

	public boolean isInRaid() {
		return inRaid;
	}

	public void setInRaid(boolean inRaid) {
		this.inRaid = inRaid;
	}

}
