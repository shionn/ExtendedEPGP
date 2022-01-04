package epgp.db.dbo;

public enum ItemSlot {
	Back(0.55, "Cape"),
	Chest(1, "Torse"),
	Head(1, "Casque"),
	Hands(0.777, "Gant"),
	Feet(0.777, "Botte"),
	Finger(0.55, "Anneau"),
	Legs(1, "Jambiere"),
	Neck(0.55, "Collier"),
	OffHand(0.55, "Main gauche"),
	RangedWeapon(0.42, "Arme a distance"),
	Shield(0.55, "Bouclier"),
	Shoulder(0.777, "Epauliere"),
	Trinket(0.7, "Bijou"),
	Waist(0.777, "Ceinture"),
	Wand(0.42, "Baguette"),
	Weapon1h(0.42, "Arme a une main"),
	Weapon2h(1, "Arme a deux mains"),
	Wrist(0.55, "Bracelet");

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
