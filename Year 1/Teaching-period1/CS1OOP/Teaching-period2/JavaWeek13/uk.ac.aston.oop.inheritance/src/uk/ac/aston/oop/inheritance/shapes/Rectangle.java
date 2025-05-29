package uk.ac.aston.oop.inheritance.shapes;

import uk.ac.aston.oop.inheritance.util.GraphicsContextWrapper;
/**
 * Rectangle specifies ulX, ulY, width and height.
 */
public class Rectangle extends Shape{
	/**
	 * Creates instance of Rectangle
	 */
	public Rectangle(double x, double y, double w, double h) {
		super(x, y, w, h);
	}
	
	/**
	 * Draws a Rectangle
	 */
	@Override
	public void draw(GraphicsContextWrapper gc) {
		gc.lineWidth(5);
		gc.rect(getX(), getY(), getWidth(), getHeight());
	}

}
