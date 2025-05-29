class ColorCircle {
  private float x;
  private float y;
  private float w;
  private color c;
  private float speedX;
  private float speedY;

  public ColorCircle() {
    reset();
  }

  private void reset() {
    speedX = random(-3, 3);
    if (abs(speedX) < 0.5) {
      if (speedX < 0) {
        speedX = -0.5;
      } else {
        speedX = 0.5;
      }
    }
    speedY = random(-3, 3);
    if (abs(speedY) < 0.5) {
      if (speedY < 0) {
        speedY = -0.5;
      } else {
        speedY = 0.5;
      }
    }

    w = random(20,80);
    x = random(0, width-w/2);
    y = random(0, height-w/2);
    c = color(random(0, 255), random(0, 255), random(0, 255), random(0, 200));
  }

  public void display() {
    fill(c);
    circle(x, y, w);
  }

  public void move() {
    x = x + speedX;
    x = constrain(x, 0+w/2, width-w/2);
    if (x + w/2 >= width || x <= 0+w/2) {
      speedX = speedX * -1;
    }
    y = y + speedY;
    y = constrain(y, 0+w/2, height-w/2);
    if (y+w/2 >= height || y <= 0+w/2) {
      speedY = speedY*-1;
    }
  }

  public float getX() {
    return x;
  }

  public float getY() {
    return y;
  }

  public float getW() {
    return w;
  }


}
