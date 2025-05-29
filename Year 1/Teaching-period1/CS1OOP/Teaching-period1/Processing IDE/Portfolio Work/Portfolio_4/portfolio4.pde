//Started 14:56 14/10/23
//Last Save 16:31 14/10/23
//Current Bug - When in corner ball is stuck

//Ball
float ballX;
float ballY;
float ballWidth;
float speedX;
float speedY;

//Hole
float holeX;
float holeY;
float holeWidth;

void setup() {
  size(600, 600);
  // reset ball parameters, pos and size
  ballX = 30;
  ballY = height/2;
  ballWidth = 60;
  // intialize the speed to random values
  initializeSpeed();
  initializeHole();
}

void draw() {
  background(127);
  // draw ball
  drawColourCircle(ballX, ballY, ballWidth, color(255, 0, 0));
  // move ball
  moveBall();
  //bounce the ball
  bounceBall();
  //nudges ball
  nudge();
  //println("x : "+speedX);
  //println("y : "+speedY);

  //hole
  drawColourCircle(holeX, holeY, holeWidth, color(0));

  //interact
  if (checkCollide(ballX, ballY, ballWidth, holeX, holeY, holeWidth)) {
    initializeHole();
    initializeSpeed();
  }
}

//ball methods
void initializeSpeed() {
  speedX = random(5, 10);
  speedY = random(5, 10);
}

void drawColourCircle(float bX, float bY, float bWidth, color bC) {
  fill(bC);
  ellipse(bX, bY, bWidth, bWidth);
}

void moveBall() {
  ballX += speedX;
  ballY += speedY;
  constrain(ballX, 0, width);
  constrain(ballY, 0, height);
}

void bounceBall() {
  if (ballX + ballWidth/2 >= width || ballX - ballWidth/2 < 0) {
    speedX *= -1;
  }
  if (ballY + ballWidth/2 >= height || ballY - ballWidth/2 < 0) {
    speedY *= -1;
  }
}

void nudge() {
  //repeated presses will cause the ball to go into a corner
  if (keyPressed) {
    if (key == 'x' || key == 'X') {
      if (ballX + speedX < width) {
        speedX = random(5, 10);
      }
    }
    if (key == 'y' || key == 'Y') {
      if (ballY + speedY < height) {
        speedY = random(5, 10);
      }
    }
  }
}

//hole methods
void initializeHole() {
  holeX = random(0, width);
  holeY = random(0, height);
  holeWidth = random(100, 300);
}

//interact method
float distance(float x1, float y1, float x2, float y2) {
  float side1;
  float side2;
  side1 = x1 - x2;
  side2 = y1 - y2;
  return sqrt((side1*side1)+(side2*side2));
}
boolean checkCollide(float bX, float bY, float bW, float hX, float hY, float hW) {
  float d;
  d = distance(bX, bY, hX, hY);
  if (d <= bW/2 + hW/2) {
    return true;
  } else {
    return false;
  }
}
