package epgp.db.dbo;

import java.util.List;

public class Item {

	private int id;
	private String name;
	private String boss;
	private boolean big;
	private RaidInstance raid;
	private ItemSlot slot;
	private int ilvl;
	private int pt;
	private int ptRatio;
	private List<PlayerClass> classes;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public RaidInstance getRaid() {
		return raid;
	}

	public void setRaid(RaidInstance raid) {
		this.raid = raid;
	}

	public String getBoss() {
		return boss;
	}

	public void setBoss(String boss) {
		this.boss = boss;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + id;
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Item other = (Item) obj;
		if (id != other.id)
			return false;
		return true;
	}

	public boolean isBig() {
		return big;
	}

	public void setBig(boolean big) {
		this.big = big;
	}

	public ItemSlot getSlot() {
		return slot;
	}

	public void setSlot(ItemSlot slot) {
		this.slot = slot;
	}

	public int getIlvl() {
		return ilvl;
	}

	public void setIlvl(int ilvl) {
		this.ilvl = ilvl;
	}

	public List<PlayerClass> getClasses() {
		return classes;
	}

	public void setClasses(List<PlayerClass> classes) {
		this.classes = classes;
	}

	public boolean isAvailableFor(PlayerClass clazz) {
		return classes.contains(clazz);
	}

	public int getPt() {
		return pt;
	}

	public void setPt(int pt) {
		this.pt = pt;
	}

	public int getPtRatio() {
		return ptRatio;
	}

	public void setPtRatio(int ptRatio) {
		this.ptRatio = ptRatio;
	}

}
