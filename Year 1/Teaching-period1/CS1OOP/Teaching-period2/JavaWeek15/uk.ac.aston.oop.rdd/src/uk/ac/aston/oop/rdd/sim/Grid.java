package uk.ac.aston.oop.rdd.sim;

public class Grid {
	private final int width, height;
	private final GridCell[][] rows;
	
	public Grid(int row, int column) {
		this.height = row;
		this.width = column;
		rows = new GridCell[height][];
		for (int i=0; i < rows.length; i++) {
			rows[i] = new GridCell[width];
			for (int j=0; j < rows[i].length; j++) {
				rows[i][j] = new GridCell(this, i, j);
			}
		}
	}
	
	// Access to width & height
	public int getWidth() {
		return width;
	}
	
	public int getHeight() {
		return height;
	}
	
	// Get position on grid
	public GridCell get(int row, int column) {
		return rows[row][column];
	}
}
