package epgp.db.dbo;

public class EpGp {

	private int ep;
	private int gp;

	public int getEp() {
		return ep;
	}

	public void setEp(int ep) {
		this.ep = ep;
	}

	public int getGp() {
		return gp;
	}

	public void setGp(int gp) {
		this.gp = gp;
	}

	public int getEpgpPct() {
		try {
			return gp * 100 / ep;
		} catch (ArithmeticException e) {
			return 0;
		}
	}

}
