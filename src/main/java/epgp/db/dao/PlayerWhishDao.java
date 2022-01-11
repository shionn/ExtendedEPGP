package epgp.db.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Many;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;

import epgp.db.dbo.Player;
import epgp.db.dbo.PlayerWish;

public interface PlayerWhishDao {

	@Delete("<script>DELETE FROM player_wish "
			+ "WHERE player = #{player.id} "
			+ "AND item NOT IN <foreach item='w' collection='player.wishes' open='(' separator=',' close=')'>#{w.item.id}</foreach>"
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
			+ "FROM player_wish AS pw " //
			+ "INNER JOIN item AS i ON i.id = pw.item " //
			+ "WHERE player = #{id} ")
	@Results({
			@Result(column = "item_name", property = "item.name"),
			@Result(column = "item_id", property = "item.id") })
	List<PlayerWish> viewPlayerWish(@Param("id") int player);

	@Insert("INSERT INTO player_wish (player, item, created) "
			+ "VALUES (#{player.id}, #{wish.item.id}, NOW()) "
			+ "ON DUPLICATE KEY UPDATE item = item ")
	int update(@Param("player") Player player, @Param("wish") PlayerWish wish);

	// @Update("UPDATE player_wish " //
	// + " SET running = false " //
	// + "WHERE player = #{player}")
	// int disableAll(@Param("player") int player);
	//
	// @Update("UPDATE player_wish " //
	// + "SET selected = NOT(selected) " //
	// + "WHERE player = #{player} AND item = #{item}")
	// int updateSelected(@Param("player") int player, @Param("item") int item);

}
