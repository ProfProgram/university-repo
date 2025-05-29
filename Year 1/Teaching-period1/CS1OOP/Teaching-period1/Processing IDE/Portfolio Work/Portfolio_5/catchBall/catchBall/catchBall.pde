// Catcher variables
float catcherX; // x coordinate of the catcher
float catcherY; // y coordinate of the catcher
float catcherWidth; // width of the catcher
float catcherSpeed; // speed of the catcher
float catcherHeight; // height of the catcher
char catcherControl; // key pressed to control the catcher
int catcherScore;  // the number of balls caught
// ball variables
float ballX; // x coordinate of the ball
float ballY; // y coordinate of the ball
float ballSpeed; // speed of movement of the ball
float ballWidth; // the diameter of the ball

void setup() {
  size(800, 600);
  rectMode(CENTER);
  catcherX = width/2; // catcher starts in the center
  catcherY = height - 100; // just up from the bottom
  catcherSpeed = 1; // slow speed of the catcher
  catcherWidth = 140; // width of the catcher
  catcherHeight = 20; // height of the catcher
  catcherScore = 0; // number of balls caught
  ballX = random(0, width); // ball random position
  ballY = 0; // at the top of the canvas
  ballSpeed = 2; // ball moves faster than the catcher
  ballWidth = 30; // diameter of the ball
}

void draw() {
  background(0);
  showScore();  // display the score at the top of the screen
  displayCatcher();  // call the function to display the catcher
  displayBall(); // call the function to display the ball
  moveCatcher();  // call the function to move the catcher
  moveBall(); // call the function to move the ball
  checkCaught();  // check if the ball is touching the catcher
}

void displayCatcher() {
  fill(255, 0, 0);
  rect(catcherX, catcherY, catcherWidth, catcherHeight);
}

void displayBall() {
  fill(0, 0, 255);
  circle(ballX, ballY, ballWidth);
}

void moveCatcher() {
  if (catcherControl == 'x') { // x moves right
    catcherX = catcherX + catcherSpeed;
  } else if (catcherControl == 'z') { // z moves left
    catcherX = catcherX - catcherSpeed;
  }
}

void moveBall() {
  ballY = (ballY + ballSpeed); // ball moves down slowly
  if (ballY >= height) { // ball at the bottom of the canvas
    resetBall();
  }
}

void resetBall() {
  ballY = 0; // ball starts again at top
  ballX = random(0, width); // in a random position
}

void checkCaught() {
  if (ballX > (catcherX - catcherWidth/2) && 
    ballX < (catcherX + catcherWidth/2) &&
    ballY + ballWidth/2 >= catcherY - catcherHeight/2 &&
    ballY - ballWidth/2 <= catcherY + catcherHeight/2) {
    increaseScore();
    resetBall();
  }
}

void increaseScore() {
  catcherScore ++;
}

void showScore() {
  fill(255);
  textSize(20);
  text("Score: " + catcherScore, 10, 50);
}

void keyPressed() {
  if (key == 'z' || key == 'x' || key == 's') {
    catcherControl = key;  // z, x, and s keys control movement
  }
}
