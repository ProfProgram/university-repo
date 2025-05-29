// variables declared here
// edit so it bounces 20 circles around canvas

ColorCircle[] circles;

void setup() {
  size(400, 400);
  // variables initialised here
  circles = new ColorCircle[20];
  for (int numCircles = 0; numCircles < 20; numCircles++) {
    circles[numCircles] = new ColorCircle();
  }
}

void draw() {
  background(255);
  // display and move every circle
  //  cannot invoke display or move on an array
  for (int numCircles = 0; numCircles < 20; numCircles++) {
    circles[numCircles].display();
    circles[numCircles].move();
  }
}
