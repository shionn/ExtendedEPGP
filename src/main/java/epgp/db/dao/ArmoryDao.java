package epgp.db.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Many;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;

import epgp.db.dbo.Armory;
import epgp.db.dbo.Item;
import epgp.player.PlayerFilterForm;

public interface ArmoryDao extends ScriptFragDao {

	@Select("<script>SELECT * FROM player " //
			+ "WHERE enable is true " //
			+ "  <if test='!form.classes.isEmpty()'>" //
			+ "    AND class IN " + IN_CLASSES //
			+ "  </if> " //
			+ "  <if test='!form.players.isEmpty()'> " //
			+ "    AND id IN " + IN_PLAYER_ID //
			+ "  </if> " //
			+ "ORDER BY class, name " //
			+ "</script>")
	@Results({
			@Result(column = "id", property = "player.id"),
			@Result(column = "name", property = "player.name"),
			@Result(column = "class", property = "player.clazz"),
			@Result(column = "id", property = "items", many = @Many(select = "listItems")) })
	List<Armory> list(@Param("form") PlayerFilterForm form);

	
	@Select("<script>SELECT i.id, i.name, i.ilvl, i.slot " //
			+ "FROM       item        AS i " //
			+ "INNER JOIN player_loot AS pl ON  i.id = pl.item "
			+ "                            AND pl.player = #{id} " //
			+ "WHERE true " //
			+ "ORDER BY slot, ilvl DESC" //
			+ "</script>")
	List<Item> listItems(@Param("id") int playerId);

	@Insert("INSERT INTO player_loot (player, raid, item, attribution) "
			+ "VALUES (#{player}, 0, #{item}, 'noRaid')")
	int add(@Param("player") int player, @Param("item") int item);

	// @Select("SELECT distinct(raid) AS raid FROM armory ORDER BY raid")
	// @Results({ @Result(column = "raid", property = "raid"),
	// @Result(column = "raid", property = "players", many = @Many(select = "listPlayers")),
	// @Result(column = "raid", property = "items", many = @Many(select = "listItems")),
	// @Result(column = "raid", property = "armories", many = @Many(select = "listArmories"))
	// })
	// List<ArmoryGroup> listGroups();
	//
	// @Select("SELECT player, player_name, class AS clazz " //
	// + "FROM armory "//
	// + "WHERE rank IN ('casu','membre') " //
	// + "GROUP BY player ORDER BY player_name")
	// List<Armory> listPlayers(@Param("raid") RaidInstance raid);
	//
	// @Select("SELECT item, item_name, class AS clazz " //
	// + "FROM armory WHERE raid = #{raid} " //
	// + "GROUP BY item, clazz ORDER BY item_name")
	// List<Armory> listItems(@Param("raid") RaidInstance raid);
	//
	// @Select("SELECT * FROM armory WHERE raid = #{raid} ")
	// List<Armory> listArmories(@Param("raid") RaidInstance raid);
	//
	// @Select("SELECT count(*) FROM player_stuff WHERE player = #{player} AND item = #{item}")
	// boolean isPlayerStuff(@Param("player") int player, @Param("item") int item);
	//
	// @Insert("INSERT INTO player_stuff (player, item) VALUES (#{player}, #{item})")
	// int addPlayerStuff(@Param("player") int player, @Param("item") int item);
	//
	// @Delete("DELETE FROM player_stuff WHERE player = #{player} AND item = #{item}")
	// int removePlayerStuff(@Param("player") int player, @Param("item") int item);

}
