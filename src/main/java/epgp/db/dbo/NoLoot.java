package epgp.db.dbo;

import java.util.Date;

public class NoLoot {
	private LootAttribution attribution;
	private Date lootDate;
	private int nbRaid;

	public LootAttribution getAttribution() {
		return attribution;
	}

	public void setAttribution(LootAttribution attribution) {
		this.attribution = attribution;
	}

	public Date getLootDate() {
		return lootDate;
	}

	public void setLootDate(Date lootDate) {
		this.lootDate = lootDate;
	}

	public int getNbRaid() {
		return nbRaid;
	}

	public void setNbRaid(int nbRaid) {
		this.nbRaid = nbRaid;
	}

}
