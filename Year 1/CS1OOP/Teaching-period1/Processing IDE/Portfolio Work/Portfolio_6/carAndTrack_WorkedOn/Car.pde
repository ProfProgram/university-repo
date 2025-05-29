class Car {
  private float x;
  private float y;
  private color clr;
  private float theSize;
  private int score;
  private boolean crossedFinish;


  public Car(float xp, float yp, float size, color c) {
    theSize = size;
    setPosition(xp);
    y = yp;
    clr = c;
    score = 0;
    this.crossedFinish = false;
  }

  public void display() {
    // offset to draw the wheels
    float wheelOffset = theSize / 4;
    rectMode(CENTER);
    // draw the chassis
    stroke(0);
    fill(clr);
    rect(x, y, theSize, theSize/2);
    // draw the score on the chassis
    textAlign(CENTER, CENTER);
    textSize(25);
    fill(255);
    text(str(score), x, y);
    strokeWeight(0);
    // draw the wheels
    fill(0);
    rect(x - wheelOffset, y - wheelOffset, wheelOffset, wheelOffset/2);
    rect(x + wheelOffset, y - wheelOffset, wheelOffset, wheelOffset/2);
    rect(x - wheelOffset, y + wheelOffset, wheelOffset, wheelOffset/2);
    rect(x + wheelOffset, y + wheelOffset, wheelOffset, wheelOffset/2);
  }

  public void move() {
    x = x + random(0, 10);
    //x += 5;    // when cars move at same speed bottom car will gain score and others dont
  }

  public float getPosition() {
    // return the X position of the front of the car
    return x + theSize/2;
  }

  public void setPosition(float newPos) {
    x = newPos - theSize/2;
  }

  public void setY(float newY) {
    y = newY;
  }

  public void increaseScore() {
    score++;
  }
  
  boolean hasCrossedFinish() {
    return crossedFinish;
  }
  
  public void setCrossedFinish(boolean crossed) {
    crossedFinish = crossed;
  }
  //public void detectOneWinner() {
  //  //for (int c1 = 0; c1 < numCars; c1++) {
  //  //  cars[c1].getPosition();
  //  //  for (int c2 = 0; c2 < numCars; c2++) {
  //  //    cars[c2].getPosition();
  //  //if (cars[count].getPosition() >= track.getFinishPosition() || cars[count+1].getPosition() >= track.getFinishPosition()) {
  //  //  if (cars[count].getPosition() > cars[count+1].getPosition()) {
  //  //    cars[count].score++;
  //  //  } else if (cars[count+1].getPosition() > cars[count].getPosition()) {
  //  //    cars[count+1].score++;
  //  //    }
  //  //  }
  //  //}
  //}
}
