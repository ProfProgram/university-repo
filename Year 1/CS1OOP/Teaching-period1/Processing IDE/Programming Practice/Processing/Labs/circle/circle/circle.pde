ColorCircle circle;

void setup() {
  size(400, 400);
  circle = new ColorCircle();
}

void draw() {
  background(255);
  circle.display();
  circle.move();
}
