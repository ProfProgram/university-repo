package uk.ac.aston.oop.inheritance.shapes;

import uk.ac.aston.oop.inheritance.util.GraphicsContextWrapper;
/**
 * Uses ulX, ulY, width and height to create a Frame.
 * The output is similar to a rectangular picture frame.
 */
public class Frame extends Shape{
	/**
	 * Creates outerRectangle and innerRectangle as protected variables
	 * protected = allows direct access for subclasses and classes in same package
	 */
	protected Rectangle outerRectangle, innerRectangle;
	
	private static final int FRAME_THICKNESS = 10;
	
	/**
	 * Creates instance of Frame.
	 * By creating instance of outer/inner Rectangles
	 */
	public Frame(double x, double y, double w, double h) {
		super(x, y, w, h);
		outerRectangle = new Rectangle(x, y, w, h);
		innerRectangle = new Rectangle(x + FRAME_THICKNESS, y + FRAME_THICKNESS, w - FRAME_THICKNESS * 2, h - FRAME_THICKNESS * 2);
	}
	
	/**
	 * Draws the outer/inner Rectangles using their own functionality as Rectangle objects
	 */
	@Override
	public void draw(GraphicsContextWrapper gc) {
		outerRectangle.draw(gc);
		innerRectangle.draw(gc);
	}
}
