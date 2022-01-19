package epgp.db.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import epgp.db.dbo.Player;
import epgp.db.dbo.PlayerWish;
import epgp.player.PlayerFilterForm;


public interface PlayerDao extends ScriptFragDao {

	@Insert("INSERT INTO player(name, class) VALUES (#{name}, #{clazz})")
	void create(Player player);

	@Select("SELECT * FROM player WHERE id = #{id}")
	@Results({ @Result(column = "class", property = "clazz") })
	Player readOne(int id);

	@Select("SELECT * FROM player WHERE enable IS true ORDER BY class, name")
	@Results({ @Result(column = "class", property = "clazz") })
	List<Player> listPlayers();

	// @Select("SELECT * FROM player WHERE rank NOT IN ('inactif', 'reroll') ORDER BY name")
	// List<Player> listMainPlayers();

	@Select("SELECT * FROM player ORDER BY name")
	List<Player> listAllPlayers();

	@Select("<script>SELECT p.name, p.class, i.name AS item_name, i.id AS item_id, pw.created " //
			+ "FROM player           AS p " //
			+ "LEFT JOIN player_wish AS pw ON p.id = pw.player "
			+ "                           AND pw.item NOT IN (SELECT item "
			+ "                                               FROM player_loot "
			+ "                                               WHERE player = p.id)"
			+ "LEFT JOIN item        AS i  ON i.id = pw.item " //
			+ "WHERE p.enable IS true " //
			+ "  <if test='!form.classes.isEmpty()'> " //
			+ "    AND p.class IN " + IN_CLASSES //
			+ "  </if> " //
			+ "  <if test='!form.players.isEmpty()'> " //
			+ "    AND p.id IN " + IN_PLAYER_ID //
			+ "  </if> " //
			+ "ORDER BY p.class, p.name </script> ")
	@Results({
			@Result(column = "name", property = "player.name"),
			@Result(column = "class", property = "player.clazz"),
			@Result(column = "item_name", property = "item.name"),
			@Result(column = "item_id", property = "item.id") })
	List<PlayerWish> listWishes(@Param("form") PlayerFilterForm form);

	@Update("UPDATE player " //
			+ "SET name = #{name}, class = #{clazz}, enable = #{enable} " //
			+ "WHERE id = #{id}")
	int updatePlayer(Player player);

}
