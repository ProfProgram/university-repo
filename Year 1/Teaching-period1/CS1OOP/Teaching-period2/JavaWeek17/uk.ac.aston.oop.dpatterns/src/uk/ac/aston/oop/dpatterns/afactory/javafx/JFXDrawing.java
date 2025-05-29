package uk.ac.aston.oop.dpatterns.afactory.javafx;

import uk.ac.aston.oop.dpatterns.afactory.Drawing;

public class JFXDrawing implements Drawing{
	
	private javafx.scene.shape.Rectangle rectangle;
	
	public JFXDrawing(javafx.scene.Group container, int width, int height) {
		rectangle = new javafx.scene.shape.Rectangle();
		rectangle.setWidth(width);
		rectangle.setHeight(height);
		container.getChildren().add(rectangle);
	}
	
	public void setFill(int r, int g, int b) {
		javafx.scene.paint.Color col = javafx.scene.paint.Color.rgb(r, g, b);
		rectangle.setFill(col);
	}
}
