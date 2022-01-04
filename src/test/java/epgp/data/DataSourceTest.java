package epgp.data;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.Iterator;

import org.json.JSONArray;
import org.json.JSONObject;
import org.junit.Test;

public class DataSourceTest {

	@Test
	public void testReadItem() throws IOException {
		try (InputStream is = Thread.currentThread().getContextClassLoader()
				.getResourceAsStream("data.json");
				BufferedReader reader = new BufferedReader(new InputStreamReader(is))) {
			StringBuilder content = new StringBuilder();
			reader.lines().forEach(content::append);
			JSONArray json = new JSONArray(content.toString());

			Iterator<Object> ite = json.iterator();
			JSONObject object = null;
			while (object == null && ite.hasNext()) {
				JSONObject next = (JSONObject) ite.next();
				if (next.getInt("itemId") == 16921) {
					object = next;
				}
			}
			System.out.println(object.toString());
		}

	}

}
