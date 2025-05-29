class Sun {
  private float x;
  private float y;
  private boolean isSmiling;

  public Sun(float xp, float yp) {
    x = xp;
    y = yp;
    isSmiling = false;
  }

  public void display() {
    noStroke();
    fill(243, 252, 0);
    circle(x, y, 80);
    if (isSmiling) {
      stroke(0);
      noFill();
      arc(x, y, 60, 60, QUARTER_PI, QUARTER_PI * 3);
      fill(0);
      circle(x-20, y, 5);
      circle(x+20, y, 5);
    }
  }

  public void setSmiling(boolean v) {
    isSmiling = v;
  }
}
