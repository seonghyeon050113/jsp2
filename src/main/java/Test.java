import java.util.HashMap;
import java.util.Map;

public class Test {


	public static void main(String[] args) {
		Map<String,String> map = new HashMap<>();
		
		System.out.println(map.isEmpty());
		map.put("1", "1");
		System.out.println(map.isEmpty());
	}
}
