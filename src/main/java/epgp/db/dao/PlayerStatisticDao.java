package epgp.db.dao;

import java.util.List;

import org.apache.ibatis.annotations.Many;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;

import epgp.db.dbo.Player;
import epgp.db.dbo.RaidAttendance;
import epgp.player.PlayerFilterForm;

public interface PlayerStatisticDao extends ScriptFragDao {

	@Select("<script>SELECT p.id, p.name, p.class as clazz, e.ep, e.gp " //
			+ "FROM player    AS p " //
			+ "LEFT JOIN epgp AS e ON e.player = p.id " //
			+ "WHERE enable IS true " //
			+ "  <if test='!form.classes.isEmpty()'>"
			+ "    AND p.class IN " + IN_CLASSES //
			+ "  </if> " //
			+ "  <if test='!form.players.isEmpty()'> " //
			+ "    AND p.id IN " + IN_PLAYER_ID //
			+ "  </if> " //
			+ "ORDER BY clazz, name </script>")
	@Results({
			@Result(column = "id", property = "id"),
			@Result(column = "ep", property = "epgp.ep"),
			@Result(column = "gp", property = "epgp.gp"),
			@Result(column = "id", property = "attendances", many = @Many(select = "listAttendances")) })
	List<Player> list(@Param("form") PlayerFilterForm form);

	@Select("SELECT * FROM raid_attendance WHERE player = #{id}")
	List<RaidAttendance> listAttendances(@Param("id") int id);

}
