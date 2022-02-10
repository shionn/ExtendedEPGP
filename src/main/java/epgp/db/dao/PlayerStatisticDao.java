package epgp.db.dao;

import java.util.List;

import org.apache.ibatis.annotations.Many;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;

import epgp.db.dbo.Loot;
import epgp.db.dbo.NoLoot;
import epgp.db.dbo.Player;
import epgp.db.dbo.RaidAttendance;
import epgp.player.PlayerFilterForm;

public interface PlayerStatisticDao extends ScriptFragDao {

	@Select("<script>SELECT p.id, p.name, p.class as clazz, e.ep, e.gp " //
			+ "FROM player    AS p " //
			+ "LEFT JOIN epgp AS e ON e.player = p.id "
			+ "WHERE enable IS true " //
			+ "  <if test='!form.classes.isEmpty()'>"
			+ "    AND p.class IN " + IN_CLASSES //
			+ "  </if> " //
			+ "  <if test='!form.players.isEmpty()'> " //
			+ "    AND p.id IN " + IN_PLAYER_ID //
			+ "  </if> " //
			+ "  <if test='form.isInRaid()'> " //
			+ "    AND p.id IN " + IN_RAID //
			+ "  </if> " //
			+ "ORDER BY clazz, name </script>")
	@Results({
			@Result(column = "id", property = "id"),
			@Result(column = "ep", property = "epgp.ep"),
			@Result(column = "gp", property = "epgp.gp"),
			@Result(column = "id", property = "attendances", many = @Many(select = "listAttendances")),
			@Result(column = "id", property = "loots", many = @Many(select = "listLoots")),
			@Result(column = "id", property = "noLoots", many = @Many(select = "listNoLoots")), })
	List<Player> list(@Param("form") PlayerFilterForm form);

	@Select("<script>SELECT p.id, p.name, p.class as clazz, e.ep, e.gp " //
			+ "FROM player    AS p " //
			+ "LEFT JOIN epgp AS e ON e.player = p.id " //
			+ "WHERE p.id = #{id} " //
			+ "ORDER BY clazz, name </script>")
	@Results({
			@Result(column = "id", property = "id"),
			@Result(column = "ep", property = "epgp.ep"),
			@Result(column = "gp", property = "epgp.gp"),
			@Result(column = "id", property = "attendances", many = @Many(select = "listAttendances")),
			@Result(column = "id", property = "loots", many = @Many(select = "listLoots")),
			@Result(column = "id", property = "noLoots", many = @Many(select = "listNoLoots")), })
	Player view(@Param("id") int player);

	@Select("SELECT * FROM raid_attendance WHERE player = #{id}")
	List<RaidAttendance> listAttendances(@Param("id") int id);

	@Select("SELECT attribution, i.id, i.name " //
			+ "FROM player_loot AS l " //
			+ "INNER JOIN item  AS i ON i.id = l.item " //
			+ "WHERE player = #{id}")
	@Results({
			@Result(column = "id", property = "item.id"),
			@Result(column = "name", property = "item.name") })
	List<Loot> listLoots(@Param("id") int id);

	@Select("SELECT * FROM player_nb_raid_without_loot WHERE player = #{id}")
	List<NoLoot> listNoLoots(@Param("id") int id);

}
