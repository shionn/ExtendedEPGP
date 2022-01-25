package epgp.db.dbo;

public enum LootAttribution {
	wishList("BIS", true),
	primary("MS", true),
	secondary("OS", false),
	bag("Sac", false),
	noRaid("Hors Raid", false);
	private String shorten;
	private boolean displayGp;

	private LootAttribution(String shorten, boolean displayGp) {
		this.shorten = shorten;
		this.displayGp = displayGp;
	}

	public String getShorten() {
		return shorten;
	}

	public boolean isDisplayGp() {
		return displayGp;
	}
}
