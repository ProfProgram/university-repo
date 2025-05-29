class Button {
  float x;
  float y;
  float bWidth;
  float bHeight;
  String text;

  public Button(float x, float y, float bWidth, float bHeight, String text) {
    this.x = x;
    this.y = y;
    this.bWidth = bWidth;
    this.bHeight = bHeight;
    this.text = text;
  }

  public float getX() {
    return x;
  }

  public float getY() {
    return y;
  }

  public float getWidth() {
    return bWidth;
  }

  public float getHeight() {
    return bHeight;
  }

  public void display() {
    fill(255, 0, 0);
    rect(x, y, bWidth, bHeight);
    textAlign(CENTER, CENTER);
    textSize(20);
    fill(0);
    text(text, x + bWidth/2, y + bHeight/2);
  }

  public boolean isInside(float xp, float yp) {
    if (xp >= x && xp <= x + bWidth && yp >= y && yp <= y + bHeight) {
      return true;
    } else {
      return false;
    }
  }
}
