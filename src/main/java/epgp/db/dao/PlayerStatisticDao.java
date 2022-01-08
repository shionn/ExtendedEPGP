package epgp.db.dao;

import java.util.List;

import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;

import epgp.db.dbo.Player;

public interface PlayerStatisticDao {

	@Select("SELECT p.id, p.name, p.class as clazz, e.ep, e.gp " //
			+ "FROM player    AS p " //
			+ "LEFT JOIN epgp AS e ON e.player = p.id " //
			+ "WHERE enable IS true " //
			+ "ORDER BY clazz, name ")
	@Results({
			@Result(column = "ep", property = "epgp.ep"),
			@Result(column = "gp", property = "epgp.gp") })
	List<Player> list();

}
