package uk.ac.aston.oop.inheritance.shapes;

import uk.ac.aston.oop.inheritance.util.GraphicsContextWrapper;
/**
 * Circle, specified as centre + radius.
 * Converts these 3 values into ulX, ulY, width and height
 */
public class Circle extends Ellipse{
	/**
	 * Creates an instance of a circle.
	 * @param centerX = X coordinate of centre of circle
	 * @param centerY = Y coordinate of centre of circle
	 * @param radius = radius of circle.
	 */
	public Circle(double centerX, double centerY, double radius) {
		super(centerX - radius, centerY - radius, radius*2, radius*2);
	}
	
	/**
	 * Returns the radius of the circle using super.getWidth()
	 * @return getWidth()/2
	 */
	public double getRadius() { return getWidth()/2; }
	
}
