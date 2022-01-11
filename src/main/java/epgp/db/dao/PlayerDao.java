package epgp.db.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import epgp.db.dbo.Player;


public interface PlayerDao {

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

	//
	// @Select("SELECT p.name, p.class, p.rank, "
	// + " i.name AS item_name, pw.attribution, pw.created, "
	// + " p.rank = 'reroll' AS reroll " //
	// + "FROM player AS p "
	// + "LEFT JOIN player_wish AS pw ON p.id = pw.player AND pw.running = true "
	// + "LEFT JOIN item AS i ON i.id = pw.item " //
	// + "WHERE p.rank != 'inactif' " //
	// + "ORDER BY reroll, p.class, p.name ")
	// @Results({ @Result(column = "name", property = "player.name"),
	// @Result(column = "class", property = "player.clazz"),
	// @Result(column = "rank", property = "player.rank"),
	// @Result(column = "item_name", property = "item.name") })
	// List<PlayerWish> listWishes();
	//
	@Update("UPDATE player " //
			+ "SET name = #{name}, class = #{clazz}, enable = #{enable} " //
			+ "WHERE id = #{id}")
	int updatePlayer(Player player);

}
