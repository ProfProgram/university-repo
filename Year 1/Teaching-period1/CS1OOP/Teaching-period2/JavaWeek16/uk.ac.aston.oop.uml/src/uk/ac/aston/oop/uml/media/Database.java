package uk.ac.aston.oop.uml.media;
import java.util.ArrayList;

public class Database {
	private ArrayList<Item> items;
	
	public Database() {
		items = new ArrayList<>();
	}
	public void addItem(Item i) {
		items.add(i);
	}
	public void print() {
		for (Item item : items) {
			System.out.println(item);
		}
	}
	public static void main(String[] args) {
		Database d = new Database();
		Video v = new Video("Video", "Director", 10);
		CD cd = new CD("Album", "Generic Artist", 5, 2);
		d.addItem(v);
		d.addItem(cd);
		d.print();
	}
}
