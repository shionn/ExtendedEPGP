package epgp.db.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Many;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import epgp.db.dbo.Item;
import epgp.db.dbo.PlayerClass;
import epgp.db.dbo.RaidInstance;


public interface ItemDao {

	@Insert("INSERT INTO item (id, name, raid, boss, ilvl, slot, pt, pt_ratio) " //
			+ "VALUES (#{id}, #{name}, #{raid}, #{boss}, #{ilvl}, #{slot}, #{pt}, #{ptRatio}) ")
	int create(Item item);

	@Insert("INSERT INTO item_assignment (item, class) VALUES (#{item}, #{class})")
	int createItemAssignment(@Param("item") int item, @Param("class") PlayerClass clazz);

	@Delete("DELETE FROM item_assignment WHERE item = #{id}")
	int deleteItemAssignment(int id);

	@Select("SELECT * FROM item ORDER BY name")
	List<Item> list();

	@Select("SELECT * FROM item WHERE raid = #{raid} ORDER BY name")
	List<Item> listForInstance(@Param("raid") RaidInstance raid);

	@Select("SELECT i.id, i.name " //
			+ "FROM       item        AS i " //
			+ "INNER JOIN raid        AS r  ON r.instance = i.raid    " //
			+ "                            AND r.id       = #{raid}   " //
			+ "INNER JOIN raid_entry  AS re ON re.raid    = r.id      " //
			+ "INNER JOIN player_wish AS pw ON pw.player  = re.player "
			+ "                            AND pw.item    = i.id      " //
			+ "GROUP BY id ORDER BY name")
	List<Item> listForRaid(@Param("raid") int id);

	@Select("SELECT i.id, i.name " //
			+ "FROM       item AS i " //
			+ "INNER JOIN item_assignment AS ia ON ia.item  = i.id "
			+ "                                AND ia.class = #{class} "
			+ "WHERE i.raid != 'None' "
			+ "ORDER BY name")
	List<Item> listForClassInRaid(PlayerClass clazz);

	@Select("SELECT * FROM item WHERE id = #{id}")
	@Results({
			@Result(column = "id", property = "id"),
			@Result(column = "id", property = "classes", many = @Many(select = "readItemAssignment")) })
	Item readOne(int id);

	@Select("SELECT class FROM item_assignment WHERE item = #{id}")
	List<PlayerClass> readItemAssignment(int id);

	@Update("UPDATE item " //
			+ "SET name   = #{name}, " //
			+ "  raid     = #{raid}, " //
			+ "  boss     = #{boss}, " //
			+ "  ilvl     = #{ilvl}, " //
			+ "  slot     = #{slot}, " //
			+ "  pt       = #{pt}, " //
			+ "  pt_ratio = #{ptRatio} "
			+ "WHERE id = #{id}")
	int update(Item item);

	@Select("SELECT * FROM item " //
			+ "WHERE id IN (SELECT item FROM item_assignment WHERE class = #{class}) "
			+ "ORDER BY name")
	List<Item> listAvailableForClass(@Param("class") PlayerClass clazz);


	@Select("SELECT i.id, i.name " //
			+ "FROM item AS i " //
			+ "INNER JOIN item_assignment AS ia ON ia.item = i.id " //
			+ "INNER JOIN player          AS p  ON p.class = ia.class "
			+ "                                AND p.id    = #{player} " //
			+ "WHERE i.raid = (SELECT instance FROM raid WHERE id = #{raid}) " //
			+ "ORDER BY raid DESC, name ASC")
	List<Item> listForRaidAndPlayer(@Param("raid") int raid, @Param("player") int player);

	@Select("SELECT raid FROM item WHERE boss = #{boss} LIMIT 1")
	RaidInstance retreiveRaid(String boss);



}
