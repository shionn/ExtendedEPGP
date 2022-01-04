package epgp.json;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;

import org.json.JSONObject;
import org.springframework.stereotype.Component;

import epgp.EpgpComputer;
import epgp.db.dbo.Item;
import epgp.db.dbo.ItemSlot;
import epgp.db.dbo.PlayerClass;
import epgp.db.dbo.RaidInstance;

@Component
public class ItemJsonParser {
	private static final String SLOT = "slot";
	private static final String SUBCLASS = "subclass";
	private static final String LABEL = "label";
	private static final String TOOLTIP = "tooltip";
	private static final String DROPPED_BY__ = "Dropped by: ";
	private static final String CLASSES__ = "Classes: ";

	public Item get(int id) {
		JSONObject json = retreiveJsonObject(id);
		System.out.println(json.toString());
		Item item = buildFrom(json);
		item.setRaid(RaidInstance.fromBoss(item.getBoss()));
		item.setPtRatio(100);
		item.setPt(new EpgpComputer().computeGp(item.getIlvl(), item.getSlot(), item.getPtRatio()));
		return item;
	}

	private JSONObject retreiveJsonObject(int id) {
		Iterator<Object> ite = ItemJsonDataHolder.get().iterator();
		while (ite.hasNext()) {
			JSONObject next = (JSONObject) ite.next();
			if (next.getInt("itemId") == 16921) {
				return next;
			}
		}
		throw new IllegalArgumentException("not found <" + id + ">");
	}

	private Item buildFrom(JSONObject json) {
		Item item = new Item();
		item.setId(json.getInt("itemId"));
		item.setName(json.getString("name"));
		item.setIlvl(json.getInt("itemLevel"));
		item.setSlot(ItemSlot.valueOf(json.getString(SLOT)));
		item.setName(retreiveToolTip(json, LABEL));
		item.setClasses(retreiveClasses(json));
		item.setBoss(retreiveBoss(json));
		return item;
	}

	private String retreiveBoss(JSONObject json) {
		Iterator<Object> ite = json.getJSONArray(TOOLTIP).iterator();
		String boss = null;
		while (ite.hasNext() && boss == null) {
			JSONObject next = (JSONObject) ite.next();
			if (next.has(LABEL) && next.getString(LABEL).startsWith(DROPPED_BY__)) {
				boss = next.getString(LABEL).substring(DROPPED_BY__.length());
			}
		}
		return boss;
	}

	private List<PlayerClass> retreiveClasses(JSONObject json) {
		Iterator<Object> ite = json.getJSONArray(TOOLTIP).iterator();
		List<PlayerClass> classes = new ArrayList<>();
		while (ite.hasNext() && classes.isEmpty()) {
			JSONObject next = (JSONObject) ite.next();
			if (next.has(LABEL) && next.getString(LABEL).startsWith(CLASSES__)) {
				String values = next.getString(LABEL).substring(CLASSES__.length());
				classes.add(PlayerClass.valueOf(values));
			}
		}
		if (classes.isEmpty()) {
			switch (json.getString(SUBCLASS)) {
			case "Cloth":
				if (ItemSlot.Back.name().equals(json.getString(SLOT))) {
					classes.addAll(Arrays.asList(PlayerClass.values()));
				} else {
					classes.add(PlayerClass.Mage);
					classes.add(PlayerClass.Priest);
					classes.add(PlayerClass.Warlock);
				}
				break;
			default:
				throw new IllegalArgumentException(
						"subclass unknown <" + json.getString(SUBCLASS) + ">");
			}
		}
		return classes;
	}

	private String retreiveToolTip(JSONObject json, String name) {
		Iterator<Object> ite = json.getJSONArray(TOOLTIP).iterator();
		String result = null;
		while (ite.hasNext() && result == null) {
			JSONObject next = (JSONObject) ite.next();
			if (next.has(name)) {
				return next.getString(name);
			}
		}
		throw new IllegalArgumentException("not found <" + name + ">");
	}

}
