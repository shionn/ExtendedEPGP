package epgp.db.dbo;

public enum RaidInstance {
	MC, BWL, ZG, Boss, AQ20, AQ40, Naxxramas;

	public static RaidInstance fromBoss(String bossName) {
		switch (bossName) {
		case "Onyxia":
			return Boss;
		}
		return null;
	}
}
