class Ball {
  // ball variables
  private float ballX; // x coordinate of the ball
  private float ballY; // y coordinate of the ball
  private float ballSpeed; // speed of movement of the ball
  private float ballWidth; // the diameter of the ball

  // Constructor - parameters are speed and width
  public Ball( float bSpeed, float bWidth) {
    ballX = random(0, width);
    ballY = 0;
    ballSpeed = bSpeed;
    ballWidth = bWidth;
  }
  // public function to display the ball
  public void display() {
    fill(0, 0, 255);
    circle(ballX, ballY, ballWidth);
  }
  // public function to move the ball
  public void move() {
    ballY = (ballY + ballSpeed); // ball moves down slowly
    if (ballY >= height) { // ball at the bottom of the canvas
      resetBall();
    }
  }
  // public function to reset the ball
  public void resetBall() {
    ballY = 0; // ball starts again at top
    ballX = random(0, width); // in a random position
  }
  // public function to return the X coordinate of the ball
  public float getX() {
    return ballX;
  }
  // public function to return the Y coordinate of the ball
  public float getY() {
    return ballY;
  }
  // public function to return the width of the ball
  public float getWidth() {
    return ballWidth;
  }
}
