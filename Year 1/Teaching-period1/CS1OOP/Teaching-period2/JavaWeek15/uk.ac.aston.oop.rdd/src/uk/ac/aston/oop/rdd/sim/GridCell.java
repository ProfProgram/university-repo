package uk.ac.aston.oop.rdd.sim;

import java.util.ArrayList;
import java.util.Random;


public class GridCell {
	private final ArrayList<Actor> contents;
	private final int row, column;
	private final Grid grid;
	
	public GridCell(Grid g, int r, int c) {
		contents = new ArrayList<Actor>();
		this.row = r;
		this.column = c;
		this.grid = g;
	}
	
	public ArrayList<Actor> getContents() {
		return contents;
	}
	
	public int getRow() {
		return row;
	}
	
	public int getColumn() {
		return column;
	}
	
	public Grid getGrid() {
		return grid;
	}
	
	public ArrayList<GridCell> getAdjacent() {
		ArrayList<GridCell> result = new ArrayList<>();
		// for loop to get rows above, at and below current cell
		for(int r=row-1; r <= row+1;r++) {
			// loop to get to the column to the left, at and right of current cell
			for(int c=column-1; c <= column+1; c++) {
				if (r == row && c == column) {
					continue;
				}
				else if(r < 0 || c < 0 || r >= grid.getHeight() || c >= grid.getWidth()) {
					continue;
				}
				else {
					result.add(grid.get(r, c));
				}
			}
		}
		return result;
	}
	
	public ArrayList<GridCell> getFreeAdjacent(){
		ArrayList<GridCell> adjacent = new ArrayList<>();
		adjacent = getAdjacent();
		ArrayList<GridCell> result = new ArrayList<>();
		for (int i=0; i < adjacent.size(); i++) {
			if (adjacent.get(i).getContents().isEmpty()) {
				result.add(adjacent.get(i));
			}
		}
		return result;
	}
	
	public GridCell getRandomFreeAdjacent(Random rnd) {
		ArrayList<GridCell> freeAdjacent = new ArrayList<>();
		freeAdjacent = getFreeAdjacent();
		if (freeAdjacent.isEmpty()) {
			return null;
		}
		else {
			return freeAdjacent.get(rnd.nextInt(freeAdjacent.size()));
		}
	}
}
