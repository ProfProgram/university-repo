package uk.ac.aston.oop.dpatterns.fmethod;

public class ExecutingCommand implements Runnable{
	
	private ExecutingCommandReader reader;
	private int dx, dy;
	
	public ExecutingCommand(ExecutingCommandReader reader, int dx, int dy) {
		this.reader = reader;
		this.dx = dx;
		this.dy = dy;
	}
	
	@Override
	public void run() {
		// TODO Auto-generated method stub
		reader.setX(reader.getX() + dx);
		reader.setY(reader.getY() + dy);
		System.out.println(String.format("new position is (%d, %d)", reader.getX(), reader.getY()));
	}

}
