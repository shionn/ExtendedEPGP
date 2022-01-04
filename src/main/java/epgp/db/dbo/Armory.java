package epgp.db.dbo;

import java.util.List;
import java.util.stream.Collectors;

public class Armory {

	private Player player;
	private List<Item> items;

	public Player getPlayer() {
		return player;
	}

	public void setPlayer(Player player) {
		this.player = player;
	}

	public List<Item> getItems() {
		return items;
	}

	public void setItems(List<Item> items) {
		this.items = items;
	}

	public List<Item> items(List<ItemSlot> slots) {
		return items.stream().filter(i -> slots.contains(i.getSlot())).collect(Collectors.toList());
	}

}
