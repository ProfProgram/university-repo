int circleX;
int circleY;
float diameter;

void setup() {
 size(500, 300);
 circleX = 400;
 circleY = 150;
 diameter = 100;
}

void draw() {
 background(255);
 ellipse(circleX, circleY, diameter, diameter);
 ellipse(circleX-diameter, circleY, diameter, diameter);
}
