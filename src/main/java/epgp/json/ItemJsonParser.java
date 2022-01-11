package epgp.json;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import epgp.EpgpComputer;
import epgp.db.dao.ItemDao;
import epgp.db.dbo.Item;
import epgp.db.dbo.ItemSlot;
import epgp.db.dbo.PlayerClass;
import epgp.db.dbo.RaidInstance;

@Component
public class ItemJsonParser {
	private static final String CATEGORY = "category";
	private static final String SOURCE = "source";
	private static final String SLOT = "slot";
	private static final String SUBCLASS = "subclass";
	private static final String LABEL = "label";
	private static final String TOOLTIP = "tooltip";
	private static final String DROPPED_BY__ = "Dropped by: ";
	private static final String CLASSES__ = "Classes: ";

	@Autowired
	private SqlSession session;

	public Item getAndCreate(int id) throws IOException {
		Item item = get(id);
		session.getMapper(ItemDao.class).create(item);
		item.getClasses().stream().forEach(clazz -> session.getMapper(ItemDao.class)
				.createItemAssignment(item.getId(), clazz));
		return item;
	}

	public Item get(int id) throws IOException {
		JSONObject json = retreiveJsonObject(id);
		System.out.println(json.toString());
		Item item = buildFrom(json);
		item.setPtRatio(100);
		item.setPt(new EpgpComputer().computeGp(item.getIlvl(), item.getSlot(), item.getPtRatio()));
		return item;
	}

	private JSONObject retreiveJsonObject(int id) throws IOException {
		Iterator<Object> ite = readJsonData().iterator();
		while (ite.hasNext()) {
			JSONObject next = (JSONObject) ite.next();
			if (next.getInt("itemId") == id) {
				return next;
			}
		}
		throw new IllegalArgumentException("not found <" + id + ">");
	}

	private JSONArray readJsonData() throws IOException {
		try (InputStream is = Thread.currentThread().getContextClassLoader()
				.getResourceAsStream("data.json");
				BufferedReader reader = new BufferedReader(new InputStreamReader(is))) {
			StringBuilder content = new StringBuilder();
			reader.lines().forEach(content::append);
			return new JSONArray(content.toString());
		}
	}

	private Item buildFrom(JSONObject json) {
		Item item = new Item();
		item.setId(json.getInt("itemId"));
		item.setName(json.getString("name"));
		item.setIlvl(json.getInt("itemLevel"));
		item.setSlot(ItemSlot.valueOf(json.getString(SLOT).replaceAll("-| ", "")));
		item.setName(retreiveToolTip(json, LABEL));
		item.setClasses(retreiveClasses(json));
		item.setRaid(retreiveRaid(json));
		item.setBoss(retreiveBoss(json, item.getRaid()));
		return item;
	}

	private RaidInstance retreiveRaid(JSONObject json) {
		return null;
	}

	private String retreiveBoss(JSONObject json, RaidInstance raid) {
		Iterator<Object> ite = json.getJSONArray(TOOLTIP).iterator();
		String boss = null;
		while (ite.hasNext() && boss == null) {
			JSONObject next = (JSONObject) ite.next();
			if (next.has(LABEL) && next.getString(LABEL).startsWith(DROPPED_BY__)) {
				boss = next.getString(LABEL).substring(DROPPED_BY__.length());
			}
		}
		if (json.has(SOURCE)) {
			switch (json.getJSONObject(SOURCE).getString(CATEGORY)) {
			case "Boss Drop":
				boss = json.getJSONObject(SOURCE).getString("name");
				break;
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
				String[] values = next.getString(LABEL).substring(CLASSES__.length()).split(", ");
				for (String value : values) {
					classes.add(PlayerClass.valueOf(value));
				}
			}
		}
		if (classes.isEmpty()) {
			switch (json.getString(SUBCLASS)) {
			case "Axe":
				classes.add(PlayerClass.Shaman);
				classes.add(PlayerClass.Warrior);
				classes.add(PlayerClass.Hunter);
				break;
			case "Cloth":
				if (ItemSlot.Back.name().equals(json.getString(SLOT))) {
					classes.addAll(Arrays.asList(PlayerClass.values()));
				} else {
					classes.add(PlayerClass.Mage);
					classes.add(PlayerClass.Priest);
					classes.add(PlayerClass.Warlock);
				}
				break;
			case "Idol":
				classes.add(PlayerClass.Druid);
				break;
			case "Leather":
				classes.add(PlayerClass.Druid);
				classes.add(PlayerClass.Rogue);
				break;
			case "Libram":
				classes.add(PlayerClass.Paladin);
				break;
			case "Mace":
				classes.add(PlayerClass.Druid);
				classes.add(PlayerClass.Paladin);
				classes.add(PlayerClass.Priest);
				classes.add(PlayerClass.Rogue);
				classes.add(PlayerClass.Shaman);
				classes.add(PlayerClass.Warrior);
				break;
			case "Mail":
				classes.add(PlayerClass.Hunter);
				classes.add(PlayerClass.Paladin);
				classes.add(PlayerClass.Shaman);
				classes.add(PlayerClass.Warrior);
				break;
			case "Miscellaneous":
				classes.addAll(Arrays.asList(PlayerClass.values()));
				break;
			case "Plate":
				classes.add(PlayerClass.Paladin);
				classes.add(PlayerClass.Warrior);
				break;
			case "Shield":
				classes.add(PlayerClass.Paladin);
				classes.add(PlayerClass.Warrior);
				classes.add(PlayerClass.Shaman);
				break;
			case "Staff":
				classes.add(PlayerClass.Druid);
				classes.add(PlayerClass.Mage);
				classes.add(PlayerClass.Priest);
				classes.add(PlayerClass.Shaman);
				classes.add(PlayerClass.Warlock);
				classes.add(PlayerClass.Warrior);
				break;
			case "Sword":
				classes.add(PlayerClass.Paladin);
				classes.add(PlayerClass.Rogue);
				classes.add(PlayerClass.Mage);
				classes.add(PlayerClass.Warrior);
				break;
			case "Wand":
				classes.add(PlayerClass.Mage);
				classes.add(PlayerClass.Priest);
				classes.add(PlayerClass.Warlock);
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
