int zoogX;
int zoogY;

void setup() {
  size(400, 400);
}

void draw() {
  zoogX = width/2;    //Zoog is drawn in middle
  zoogY = height/2;   //Zoog is drawn in middle
  background(225);    //white background
  rectMode(CENTER);   //rects set to CENTER
  stroke(0);          //Zoogs Body
  fill(150);
  rect(zoogX, zoogY, 20, 100);  //drawn at(zoogX, zoogY)
  fill(225);          //Zoog's head
  ellipse(zoogX, zoogY-30, 60, 60);
  fill(0);            //Zoog's eyes
  ellipse(zoogX-19, zoogY-30, 16, 32);
  ellipse(zoogX+19, zoogY-30, 16, 32);
  stroke(0);          // Zoog's legs
  line(zoogX-10, zoogY+50, zoogX-10, zoogY+80);
  line(zoogX+10, zoogY+50, zoogX+10, zoogY+80);
}
