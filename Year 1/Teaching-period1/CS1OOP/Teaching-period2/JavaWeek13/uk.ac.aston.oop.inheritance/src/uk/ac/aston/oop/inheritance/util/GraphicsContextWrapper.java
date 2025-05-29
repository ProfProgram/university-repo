package uk.ac.aston.oop.inheritance.util;

import javafx.scene.canvas.GraphicsContext;
import javafx.scene.paint.Color;

/**
 * Thin wrapper over a JavaFX {@link GraphicsContextWrapper}.
 * Used for testing purposes in AutoFeedback: this is needed
 * because Mockito cannot mock final methods or classes unless
 * using opt-in plugins with lax security permissions.
 */
public class GraphicsContextWrapper {

	private GraphicsContext gc;

	/**
	 * Creates a new wrapper.
	 *
	 * @param gc JavaFX context to be wrapped.
	 */
	public GraphicsContextWrapper(GraphicsContext gc) {
		this.gc = gc;
	}

	/**
	 * Draws an oval.
	 *
	 * @param x X coordinate of the top left corner: 0 is left edge of screen.
	 * @param y Y coordinate of the top right corner: 0 is top edge of screen.
	 * @param w Width of the oval.
	 * @param h Height of the oval.
	 */
	public void oval(double x, double y, double w, double h) {
		gc.strokeOval(x, y, w, h);
	}

	/**
	 * Changes the fill color for all subsequent draw calls.
	 *
	 * @param fill Fill color to be used from now on.
	 */
	public void fill(Color fill) {
		gc.setFill(fill);
	}

	/**
	 * Draws a filled rectangle.
	 *
	 * @param x X coordinate of the top left corner: 0 is left edge of screen.
	 * @param y Y coordinate of the top right corner: 0 is top edge of screen.
	 * @param w Width of the rectangle.
	 * @param h Height of the rectangle.
	 */
	public void fillRect(double x, double y, double w, double h) {
		gc.fillRect(x, y, w, h);
	}

	/**
	 * Sets the line width for all later calls.
	 *
	 * @param lw New line width to be used (0 is a hairline stroke).
	 */
	public void lineWidth(int lw) {
		gc.setLineWidth(lw);
	}

	/**
	 * Draws a rectangle without any fill.
	 *
	 * @param x X coordinate of the top left corner: 0 is left edge of screen.
	 * @param y Y coordinate of the top right corner: 0 is top edge of screen.
	 * @param w Width of the rectangle.
	 * @param h Height of the rectangle.
	 */
	public void rect(double x, double y, double w, double h) {
		gc.strokeRect(x, y, w, h);
	}

}
