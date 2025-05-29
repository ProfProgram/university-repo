public class ExampleMain {
	public static void main(String[] args) {
		System.out.println("Hello from Java!");
		if (args.length != 0) {
			System.out.print("Args in decending order are: ");
			for (int i = 0; i < args.length; i++) {
				System.out.println( args[i] );
			}
		} else {
			System.out.println("There are zero args.");
		}
	}
}