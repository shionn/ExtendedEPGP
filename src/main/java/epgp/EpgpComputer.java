package epgp;

import epgp.db.dbo.ItemSlot;

/**
 * https://wowwiki.fandom.com/wiki/EPGP
 */
public class EpgpComputer {

	public int computeGp(int ilvl, ItemSlot slot, int ratio) {
		return (int) (ilvl * ilvl * slot.getGpRatio() * ratio / 100);
	}

}
