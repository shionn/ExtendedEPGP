package epgp.db.dbo;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

public class Raid {
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

}
