package epgp.json;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;

import org.json.JSONArray;

public class ItemJsonDataHolder {
	private static final class ItemJsonDataLazyHolder {
		private static ItemJsonDataHolder instance = new ItemJsonDataHolder();
		public static ItemJsonDataHolder get() {
			return instance;
		}
	};

	private ItemJsonDataHolder() {
		try (InputStream is = Thread.currentThread().getContextClassLoader()
				.getResourceAsStream("data.json");
				BufferedReader reader = new BufferedReader(new InputStreamReader(is))) {
			StringBuilder content = new StringBuilder();
			reader.lines().forEach(content::append);
			datas = new JSONArray(content.toString());
		} catch (IOException e) {
			throw new IllegalStateException(e);
		}
	}

	public static JSONArray get() {
		return ItemJsonDataLazyHolder.get().datas;
	}

	private JSONArray datas;

}
