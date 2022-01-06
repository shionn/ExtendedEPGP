package epgp.db.dao;

import java.util.List;

import org.apache.ibatis.annotations.Many;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;

import epgp.db.dbo.Loot;
import epgp.db.dbo.Raid;
import epgp.db.dbo.RaidEntry;

public interface RaidHistoricDao {

	@Select("SELECT id, name, date, instance " //
			+ "FROM raid " //
			+ "ORDER BY date DESC")
	@Results({ @Result(column = "id", property = "id"),
			@Result(column = "id", property = "entries", many = @Many(select = "listEntries")) })
	List<Raid> listAll();

	@Select("SELECT p.id, name, class, raid, r.bench, r.absent " //
			+ "FROM player AS p " //
			+ "INNER JOIN raid_entry AS r ON p.id = r.player AND r.raid = #{raid} "
			+ "ORDER BY class, name")
	@Results({
			@Result(column = "name", property = "player.name"),
			@Result(column = "class", property = "player.clazz"),
			@Result(column = "{player=id,raid=raid}", property = "loots", many = @Many(select = "listLoot")) })
	List<RaidEntry> listEntries(@Param("raid") int raid);

	@Select("SELECT pl.attribution, i.id, i.name " //
			+ "FROM      player_loot AS pl " //
			+ "LEFT JOIN item        AS i ON i.id = pl.item " //
			+ "WHERE player = #{player} AND pl.raid = #{raid} "
			+ "ORDER BY name ")
	@Results({ @Result(column = "id", property = "item.id") })
	public List<Loot> listLoot(@Param("player") int player, @Param("raid") int raid);
}
