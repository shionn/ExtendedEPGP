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
	private List<Loot> loots;
	private List<NoLoot> noLoots;

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

	public List<RaidAttendance> getAttendances() {
		return attendances;
	}

	public void setAttendances(List<RaidAttendance> attendances) {
		this.attendances = attendances;
	}

	public RaidAttendance attendance(RaidInstance instance, RaidAttendancePeriod period) {
		return attendances.stream()
				.filter(a -> a.getInstance() == instance && a.getPeriod() == period).findFirst()
				.orElseGet(() -> new RaidAttendance());
	}

	public int getAllAttendancesCount() {
		return attendances.stream().filter(a -> a.getPeriod() == RaidAttendancePeriod.always)
				.map(a -> a.getAttendance())
				.reduce(0, (a,b)->a+b);
	}

	public List<Loot> getLoots() {
		return loots;
	}

	public void setLoots(List<Loot> loots) {
		this.loots = loots;
	}

	public int lootCount(LootAttribution attribution) {
		return (int) loots.stream().filter(l -> l.getAttribution() == attribution).count();
	}

	public List<NoLoot> getNoLoots() {
		return noLoots;
	}

	public void setNoLoots(List<NoLoot> noLoots) {
		this.noLoots = noLoots;
	}

	public NoLoot noLoot(LootAttribution attribution) {
		return noLoots.stream().filter(l->l.getAttribution()==attribution).findFirst().orElse(null);
	}

}
