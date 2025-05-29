package uk.ac.aston.oop.dpatterns.singleton;

public class Player {
	
	private int dieFaces;
	
	public Player(int dieFaceCount) {
		// TODO Auto-generated constructor stub
		this.dieFaces = dieFaceCount;
	}

	public int roll() {
		// TODO Auto-generated method stub
		return DiceRoller.getInstance().roll(dieFaces);
	}

	public int getDieFaces() {
		// TODO Auto-generated method stub
		return dieFaces;
	}

}
