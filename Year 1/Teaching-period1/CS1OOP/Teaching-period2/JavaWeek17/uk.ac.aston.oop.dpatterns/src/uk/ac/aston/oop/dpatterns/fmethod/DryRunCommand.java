package uk.ac.aston.oop.dpatterns.fmethod;

public class DryRunCommand implements Runnable{
	
	private String message;
	
	public DryRunCommand(String message) {
		this.message = message;
	}
	
	public void run() {
		System.out.println(message);
	}
}
