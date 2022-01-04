package epgp.db.dbo;

public enum ItemSlot {
	TwoHand(1, "Arme a deux mains"),
	MainHand(0.42, "Main principale"),
	HeldInOffhand(0.55, "Tenue en Main gauche"),
	OffHand(0.55, "Main gauche"),
	Shield(0.55, "Bouclier"),
	Ranged(0.42, "Arme a distance"), // Baguette
	Relic(0.42, "Relique"),

	Head(1, "Casque"),
	Neck(0.55, "Collier"),
	Shoulder(0.777, "Epauliere"),
	Back(0.55, "Cape"),
	Chest(1, "Torse"),
	Wrist(0.55, "Bracelet"),
	Hands(0.777, "Gant"),

	Waist(0.777, "Ceinture"),
	Legs(1, "Jambiere"),
	Feet(0.777, "Botte"),
	Finger(0.55, "Anneau"),
	Trinket(0.7, "Bijou"),

	// RangedWeapon(0.42, "Arme a distance"),
	Weapon1h(0.42, "Arme a une main");

	private double gpRatio;
	private String fr;

	private ItemSlot(double gpRatio, String fr) {
		this.gpRatio = gpRatio;
		this.fr = fr;
	}

	public double getGpRatio() {
		return gpRatio;
	}

	public String getFr() {
		return fr;
	}

}
