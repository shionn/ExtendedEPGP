package epgp.db.dbo;

public enum LootAttribution {
	wishList("BIS", true, "Bis"),
	primary("MS", true, "Upgrade"),
	secondary("OS", false, "Autres"),
	bag("Sac", false, ""),
	noRaid("Hors Raid", false, "");
	private String shorten;
	private String rcLootName;
	private boolean displayGp;

	private LootAttribution(String shorten, boolean displayGp, String rcLootName) {
		this.shorten = shorten;
		this.displayGp = displayGp;
		this.rcLootName = rcLootName;
	}

	public String getShorten() {
		return shorten;
	}

	public boolean isDisplayGp() {
		return displayGp;
	}

	public String rcLootName() {
		return rcLootName;
	}
}
