package uk.ac.aston.oop.inheritance.shapes;

import uk.ac.aston.oop.inheritance.util.GraphicsContextWrapper;
/** 
 * Shape is the superClass to all other shapes.
 * specifies ulX, ulY, width, and height. (Shapes are drawn from top left corner)
 */
public class Shape {
	private double ulX, ulY, wdth, hght;
	
	/**
	 * Creates a new instance.
	 * 
	 * @param x = x coordinate of upper left corner.
	 * @param y = y coordinate of upper left corner.
	 * @param w = size of shape along X axis.
	 * @param h = size of shape along Y axis.
	 */
	public Shape(double x, double y, double w, double h) {
		this.ulX = x;
		this.ulY = y;
		this.wdth = w;
		this.hght = h;
		
	}
	
	/**
	 * Returns the X coordinate of the upper left corner.
	 * @return X coordinate of upper left corner
	 */
	public double getX() { return ulX;}
	/**
	 * Returns the Y coordinate of the upper left corner.
	 * @return Y coordinate of upper left corner
	 */
	public double getY() { return ulY;}
	/**
	 * Returns the width of shape.
	 * @return width.
	 */
	public double getWidth() { return wdth;}
	/**
	 * Returns the height of the shape.
	 * @return height.
	 */
	public double getHeight() { return hght;}
	
	/**
	 * Draw has no set functionality as we cannot draw anything until further context of the shape to be drawn is given.
	 * print's a console line as placeholder.
	 * @param gc is the graphical element, allows shapes to be drawn to screen/window.
	 * @param gc is required for all shape subclasses
	 */
	public void draw(GraphicsContextWrapper gc) {
		System.out.println("Without further context there is no point in drawing a random shape.");
	}
}
