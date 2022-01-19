package epgp.db.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Many;
import org.apache.ibatis.annotations.One;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;

import epgp.db.dbo.Player;
import epgp.db.dbo.PlayerWish;

public interface PlayerWhishDao {

	@Delete("<script>DELETE FROM player_wish "
			+ "WHERE player = #{player.id} "
			+ "AND item NOT IN <foreach item='w' collection='player.wishes' open='(' separator=',' close=')'>#{w.item.id}</foreach> "
			+ "AND item NOT IN (SELECT item FROM player_loot WHERE player = #{player.id}) "
			+ "</script>")
	int deleteOldWish(@Param("player") Player player);

	@Select("SELECT * FROM player WHERE id = #{id}")
	@Results({
			@Result(column = "id", property = "id"),
			@Result(column = "class", property = "clazz"),
			@Result(column = "id", property = "wishes", many = @Many(select = "viewPlayerWish")) })
	Player viewPlayer(int player);

	@Select("SELECT i.name AS item_name, " //
			+ " i.id AS item_id " //
			+ "FROM       player_wish AS pw " //
			+ "INNER JOIN item        AS i  ON i.id = pw.item " //
			+ "WHERE player = #{id} "
			+ "AND pw.item NOT IN (SELECT item FROM player_loot WHERE player = #{id}) ")
	@Results({
			@Result(column = "item_name", property = "item.name"),
			@Result(column = "item_id", property = "item.id") })
	List<PlayerWish> viewPlayerWish(@Param("id") int player);

	@Select("SELECT i.name AS item_name, " //
			+ "  i.id      AS item_id, " //
			+ "  p.id      AS player_id " //
			+ "FROM       player_wish AS pw " //
			+ "INNER JOIN item        AS i  ON i.id      = pw.item "
			+ "                            AND i.id      = #{item} "
			+ "INNER JOIN raid_entry  AS re ON re.player = pw.player "
			+ "                            AND re.raid   = #{raid} "
			+ "INNER JOIN player      AS p  ON p.id      = pw.player " //
			+ "ORDER BY p.name ")
	@Results({
			@Result(column = "item_name", property = "item.name"),
			@Result(column = "item_id", property = "item.id"),
			@Result(column = "player_id", property = "player", one = @One(select = "epgp.db.dao.PlayerStatisticDao.view")) })
	List<PlayerWish> listForRaid(@Param("item") int item, @Param("raid") int raid);

	@Insert("INSERT INTO player_wish (player, item, created) "
			+ "VALUES (#{player.id}, #{wish.item.id}, NOW()) "
			+ "ON DUPLICATE KEY UPDATE item = item ")
	int update(@Param("player") Player player, @Param("wish") PlayerWish wish);



}
