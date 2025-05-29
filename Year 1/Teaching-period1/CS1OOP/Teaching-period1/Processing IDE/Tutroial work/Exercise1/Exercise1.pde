int circleX;
int circleY;
int diameter;

void setup() {
  //sets size of canvas
 size(200,200); 
 circleX = 0;
 circleY = 100;
 diameter = 0;
}

void draw() {
  //sets the background colour to white
  //when background is set in setup it only runs the command once so you end up with a shadowed mouse rather than an image follwing it cleanly
  //if background is at end of draw() then it will overwrite the shapes or anything else in draw as backgroud shall be drawn over it
  background(255);
  //sets outline of shape to black
  stroke(0);
  //sets the shape inside colour to a light grey
  fill(175);
  //draws an a circle with diameter 50 pixels with centre point (100,100)
  //lab1.5; circleX,circleY change the circle's center so that its drawn at x=0, this makes it so that you only see a semi-circle
  ellipse(circleX,circleY,diameter,diameter);
  circleX = circleX+1;
  diameter = diameter+1;
}
