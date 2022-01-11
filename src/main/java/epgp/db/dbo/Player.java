package epgp.db.dbo;

import java.util.List;

public class Player {

	private int id;
	private String name;
	private PlayerClass clazz;
	private int main;
	private boolean enable;
	private EpGp epgp;
	private List<RaidAttendance> attendances;

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

	public boolean isEnable() {
		return enable;
	}

	public void setEnable(boolean enable) {
		this.enable = enable;
	}

	public EpGp getEpgp() {
		return epgp;
	}

	public void setEpgp(EpGp epgp) {
		this.epgp = epgp;
	}

	public RaidAttendance getAttendance(RaidInstance instance, RaidAttendancePeriod period) {
		return attendances.stream()
				.filter(a -> a.getInstance() == instance && a.getPeriod() == period).findFirst()
				.orElseGet(() -> new RaidAttendance());
	}

	public List<RaidAttendance> getAttendances() {
		return attendances;
	}


	public void setAttendances(List<RaidAttendance> attendances) {
		this.attendances = attendances;
	}

}
