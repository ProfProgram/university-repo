class Ball {

  float x;
  float y;

  float ballS;

  float xspeed;
  float yspeed;

  Ball(float tBallS, float tXSpeed, float tYSpeed) {
    //ball point
    x = width/2;
    y = height/2;

    ballS = tBallS;

    //ball speed
    xspeed = tXSpeed;
    yspeed = tYSpeed;
  }

  Ball() {
    x = random(width);
    y = random(height);
    ballS = random(10,100);
    xspeed = random(1,5);
    yspeed = random(1,3);
  }

  void displayBall() {
    stroke(0);
    fill(127);
    ellipse(x, y, ballS, ballS);
  }

  void moveBall() {
    x += xspeed;
    y += yspeed;
  }

  void checkEdges() {
    if (x > width - ballS/2 || x -ballS/2 < 0) {
      xspeed *= -1;
    }
    if (y > height -ballS/2 || y -ballS/2 < 0) {
      yspeed *= -1;
    }
  }

  void gone() {
    ballS = 0;
    x = -1;
    y = -1;
    xspeed = 0;
    yspeed = 0;
  }
  
  boolean overlaps(Ball other) {
    float d = dist(x,y,other.x,other.y);
    if (d < ballS + other.ballS) {
      return true;
    }else {
      return false;
    }
    
  }
}
