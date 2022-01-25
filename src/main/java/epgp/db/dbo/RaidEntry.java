package epgp.db.dbo;

import java.util.List;

public class RaidEntry {
	private Player player;
	private Raid raid;
	private boolean bench;
	private boolean absent;
	private boolean member;
	private boolean quit;
	private List<Loot> loots;

	public Player getPlayer() {
		return player;
	}

	public void setPlayer(Player player) {
		this.player = player;
	}

	public boolean isBench() {
		return bench;
	}

	public void setBench(boolean bench) {
		this.bench = bench;
	}

	public boolean isAbsent() {
		return absent;
	}

	public void setAbsent(boolean absent) {
		this.absent = absent;
	}

	public boolean isMember() {
		return member;
	}

	public void setMember(boolean member) {
		this.member = member;
	}

	public List<Loot> getLoots() {
		return loots;
	}

	public void setLoots(List<Loot> loots) {
		this.loots = loots;
	}

	public boolean isQuit() {
		return quit;
	}

	public void setQuit(boolean quit) {
		this.quit = quit;
	}

	public Raid getRaid() {
		return raid;
	}

	public void setRaid(Raid raid) {
		this.raid = raid;
	}
}
