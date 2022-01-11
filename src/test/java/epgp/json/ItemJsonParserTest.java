package epgp.json;

import static org.assertj.core.api.Assertions.assertThat;

import java.io.IOException;

import org.junit.Test;

import epgp.db.dbo.Item;
import epgp.db.dbo.ItemSlot;
import epgp.db.dbo.PlayerClass;
import epgp.db.dbo.RaidInstance;

public class ItemJsonParserTest {

	@Test
	public void testHaloOfTranscendence() throws IOException {
		Item item = new ItemJsonParser().get(16921);
		assertThat(item.getId()).isEqualTo(16921);
		assertThat(item.getName()).isEqualTo("Halo of Transcendence");
		assertThat(item.getIlvl()).isEqualTo(76);
		assertThat(item.getSlot()).isEqualTo(ItemSlot.Head);
		assertThat(item.getPt()).isEqualTo(5776);
		assertThat(item.getPtRatio()).isEqualTo(100);
		assertThat(item.getClasses()).containsExactly(PlayerClass.Priest);
		assertThat(item.getBoss()).isEqualTo("Onyxia");
		assertThat(item.getRaid()).isEqualTo(RaidInstance.Boss);
	}
}
