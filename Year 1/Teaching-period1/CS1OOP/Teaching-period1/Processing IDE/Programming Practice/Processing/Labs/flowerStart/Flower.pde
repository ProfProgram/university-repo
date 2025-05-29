class Flower {
  private float maxHeight;
  private float currentHeight;
  private float x;
  private int maxAge;
  private int currentAge;

  public Flower(float h, int ma) {
    maxHeight = h;
    currentHeight = 0;
    x = random(20, width-20);
    maxAge = ma;
    currentAge = 0;
  }

  public void display() {
    noStroke();
    fill(0, 255, 0);
    rect(x, height - currentHeight, 10, currentHeight);
    if (currentHeight == maxHeight) {
      fill(173, 31, 43); // dark pink petals
      ellipse(x, height-maxHeight+30, 40, 40);
      ellipse(x, height-maxHeight-30, 40, 40);
      ellipse(x-30, height-maxHeight, 40, 40);
      ellipse(x+30, height-maxHeight, 40, 40);
      fill(250, 182, 234); // lighter pink centre
      circle(x, height-maxHeight, 40);
    }
  }

  public void grow() {
    if (currentHeight < maxHeight) {
      currentHeight = currentHeight + 1;
    } else {
      currentAge++;
      if (currentAge >= maxAge) {
        currentAge = 0;
        currentHeight = 0;
        x = random(20, width-20);
      }
    }
  }

  public boolean isMaxHeight() {
    return currentHeight == maxHeight;
  }
}
