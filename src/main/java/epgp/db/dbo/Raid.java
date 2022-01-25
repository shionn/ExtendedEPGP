package epgp.db.dbo;

import java.util.Date;
import java.util.List;
import java.util.Objects;

import org.springframework.format.annotation.DateTimeFormat;

public class Raid implements Comparable<Raid> {
	private int id;
	private String name;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date date;
	private boolean running;
	private List<RaidEntry> entries;
	private RaidInstance instance;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}


	public boolean isRunning() {
		return running;
	}

	public void setRunning(boolean running) {
		this.running = running;
	}

	public List<RaidEntry> getEntries() {
		return entries;
	}

	public void setEntries(List<RaidEntry> entries) {
		this.entries = entries;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public RaidInstance getInstance() {
		return instance;
	}

	public void setInstance(RaidInstance instance) {
		this.instance = instance;
	}

	@Override
	public int hashCode() {
		return Objects.hash(id);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj) return true;
		if (obj == null) return false;
		if (getClass() != obj.getClass()) return false;
		Raid other = (Raid) obj;
		return id == other.id;
	}

	@Override
	public int compareTo(Raid o) {
		int compare = o.date.compareTo(date);
		if (compare == 0) {
			compare = Integer.compare(o.id, id);
		}
		return compare;
	}

}
