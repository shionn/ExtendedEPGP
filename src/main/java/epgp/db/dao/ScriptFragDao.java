package epgp.db.dao;

public interface ScriptFragDao {
	public static final String IN_CLASSES = "<foreach item='c' " //
			+ "collection='form.classes' " //
			+ "open='(' separator=',' close=')'" //
			+ ">#{c}</foreach>"; //

	public static final String IN_PLAYER_ID = "<foreach item='player_id' " //
			+ "collection='form.players' " //
			+ "open='(' separator=',' close=')'" //
			+ ">#{player_id}</foreach>"; //
}
