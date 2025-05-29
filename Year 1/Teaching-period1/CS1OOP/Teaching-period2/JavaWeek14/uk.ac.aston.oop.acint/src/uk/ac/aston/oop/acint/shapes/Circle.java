package uk.ac.aston.oop.acint.shapes;

public class Circle extends Ellipse {

	public Circle(double centerX, double centerY, double radius) {
		super(centerX - radius, centerY - radius, radius * 2, radius * 2);
	}

    public double getRadius() { return getWidth()/2; }
    
    public void scale(double ratio) {
    	super.width = super.width * ratio;
    	super.height = super.height * ratio;
    }
}
