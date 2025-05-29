class Button {
  float x;
  float y;
  float w;
  float h;
  String label;

  public Button(float xp, float yp, float wd, float ht) {
    this.x = xp;
    this.y = yp;
    this.w = wd;
    this.h = ht;
  }

  public void display() {
    fill(255, 0, 0);
    rect(x, y, w, h);
    textAlign(CENTER, CENTER);
    textSize(20);
    fill(0);
    text(label, x + w/2, y + h/2);
  }
  
  public void setLabel(String l) {
    label = l;
  }

  public boolean isInside(float xp, float yp) {
    if (xp >= x && xp <= x + w && yp >= y && yp <= y + h) {
      return true;
    } else {
      return false;
    }
  }
}
