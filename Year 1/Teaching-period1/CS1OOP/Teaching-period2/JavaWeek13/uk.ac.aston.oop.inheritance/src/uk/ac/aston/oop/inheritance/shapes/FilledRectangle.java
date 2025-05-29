package uk.ac.aston.oop.inheritance.shapes;

import javafx.scene.paint.Color;
import uk.ac.aston.oop.inheritance.util.GraphicsContextWrapper;
/**
 * FilledRectangle adds to Rectangle.
 * Allows you to add a colour to the body of the shape.
 */
public class FilledRectangle extends Rectangle{
	private Color fill;
	/**
	 * Creates instance of Rectangle with coloured body
	 * @param f = colour of shapes body
	 */
	public FilledRectangle(Color f, double x, double y, double w, double h) {
		super(x, y, w, h);
		this.fill = f;
	}
	/**
	 * Returns the shapes body colour
	 * @return fill
	 */
	public Color getFill() { return fill;}
	
	/**
	 * Draws a coloured Rectangle
	 */
	@Override
	public void draw(GraphicsContextWrapper gc) {
		super.draw(gc);	// when super.draw is called at start it does not get thick border
		gc.fill(getFill());
		gc.fillRect(getX(), getY(), getWidth(), getHeight());
//		super.draw(gc);
	}
}
