package uk.ac.aston.oop.inheritance.shapes;

import uk.ac.aston.oop.inheritance.util.GraphicsContextWrapper;
/**
 * Ellipse is called using ulX, ulY, width and height.
 */
public class Ellipse extends Shape{
	/**
	 * Creates instance of an Ellipse
	 */
	public Ellipse(double x, double y, double w, double h) {
		super(x, y, w, h);
	}
	
	/**
	 * Draws an oval to the window
	 */
	@Override
	public void draw(GraphicsContextWrapper gc) {
		gc.oval(getX(), getY(), getWidth(), getHeight());
	}
	
}
