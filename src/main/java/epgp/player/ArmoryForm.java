package epgp.player;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Component;
import org.springframework.web.context.annotation.SessionScope;

import epgp.db.dbo.PlayerClass;

@Component
@SessionScope
public class ArmoryForm {

	private List<PlayerClass> classes = new ArrayList<>();

	public boolean isClassSelected(PlayerClass clazz) {
		return classes.contains(clazz);
	}

	public String getLinkColor(PlayerClass clazz) {
		return isClassSelected(clazz) ? "green" : "red";
	}

	public void toggleClass(PlayerClass clazz) {
		if (isClassSelected(clazz)) {
			classes.remove(clazz);
		} else {
			classes.add(clazz);
		}
	}

	public List<PlayerClass> getClasses() {
		return classes;
	}

}
