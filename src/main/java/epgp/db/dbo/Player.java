package epgp.db.dbo;

public class Player {

	private int id;
	private String name;
	private PlayerClass clazz;
	private int main;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public PlayerClass getClazz() {
		return clazz;
	}

	public void setClazz(PlayerClass clazz) {
		this.clazz = clazz;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getMain() {
		return main;
	}

	public void setMain(int main) {
		this.main = main;
	}
}
