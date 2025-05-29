int vX;
int vY;
float colourC = random(256);    // car colour
float colourW = random(256);    //wheel colour; could just write random(256) inside the fill command however found the effect may cause seizure

void setup() {
  fullScreen();
  vX = width/2;                //draws car in center
  vY = height/2;
}

void draw() {
  vX = mouseX-125;            //center the mouse in middle of car
  vY = mouseY-50;
  background(0,0,255);        //background erases previous cars and therfore stops shadowing/painting effect
  noStroke();
  fill(colourC);              //setting colours of car body
  rect(vX, vY, 200, 100);            //drawing main part of car body w/rectangles
  rect(vX+50, vY-50, 120, 50);
  rect(vX+200, vY+25, 50, 75);
  triangle(vX+20, vY, vX+50, vY-50, vX+50, vY);            //triangles to give some visual differences
  triangle(vX+200, vY, vX+170, vY-50, vX+170, vY);
  triangle(vX+200, vY, vX+200, vY+25, vX+250, vY+25);
  noStroke();
  fill(colourW);                      //colour of wheels
  ellipse(vX+50, vY+100, 25, 25);     //wheels
  ellipse(vX+200, vY+100, 25, 25);
  //stroke(255,0,0);
  //line(vX+195, vY+100, vX+205, vY+100); //creates horizontal line through the right wheel
  //line(vX+200, vY+95, vX+200, vY+105);     //verticle line on right wheel
  //lines dont work since the wheels are not big enough also dont create a rotating motion
}
