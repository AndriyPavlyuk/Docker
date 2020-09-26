import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class Sample {
	public static void main(String[] args) throws IOException {
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		System.out.print("Please, enter your name:");
		String name = br.readLine();
		System.out.println("Hello, " + name);
	}
}