package epgp.db.dao;

import java.util.List;

import org.apache.ibatis.annotations.Many;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;

import epgp.db.dbo.Player;
import epgp.db.dbo.RaidEntry;
import epgp.player.PlayerFilterForm;

public interface PlayerHistoryDao extends ScriptFragDao {

	@Select("<script>SELECT p.id, p.name, p.class as clazz " //
			+ "FROM player    AS p " //
			+ "WHERE enable IS true " //
			+ "  <if test='!form.classes.isEmpty()'>" //
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
			@Result(column = "id", property = "histories", many = @Many(select = "view")) })
	List<Player> list(@Param("form") PlayerFilterForm form);

	@Select("SELECT r.id  AS raid_id, " //
			+ "r.name     AS raid_name, " //
			+ "r.instance AS raid_instance, " //
			+ "r.date     AS raid_date, " //
			+ "re.player  AS player_id, " //
			+ "re.absent, re.bench, re.quit " //
			+ "FROM raid AS r " //
			+ "INNER JOIN raid_entry AS re ON re.raid = r.id AND re.player = #{id} "
			+ "ORDER BY date DESC, raid_id DESC ")
	@Results({
			@Result(column = "raid_id", property = "raid.id"),
			@Result(column = "raid_name", property = "raid.name"),
			@Result(column = "raid_instance", property = "raid.instance"),
			@Result(column = "raid_date", property = "raid.date"),
			@Result(column = "{player=player_id, raid=raid_id}", property = "loots", many = @Many(select = "epgp.db.dao.RaidDao.listLoot")) })
	List<RaidEntry> view(@Param("id") int playerId);
}
