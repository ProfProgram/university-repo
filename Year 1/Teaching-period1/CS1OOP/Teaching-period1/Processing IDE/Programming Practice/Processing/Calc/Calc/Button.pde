class Button {
  float x;
  float y;
  float w;
  float h;
  String label;

  public Button(float xp, float yp, float wd, float ht) {
    x = xp;
    y = yp;
    w = wd;
    h = ht;
  }

  public boolean isInside(float mx, float my) {
    if (mx >= x && mx <= x + w && my >= y && my <= y + h) {
      return true;
    } else {
      return false;
    }
  }

  public void setText(String t) {
    label = t;
  }

  public String getText() {
    return label;
  }

  public void display() {
    fill(180, 180, 0);
    stroke(0);
    rect(x, y, w, h);
    fill(0);
    textSize(30);
    textAlign(CENTER, CENTER);
    text(label, x+(w/2), y+(h/2));
  }

  public void setX(int x) {
    this.x = x;
  }
  
  public void setY(int y) {
    this.y = y;
  }
  
  public void setBtnState(float xp, float yp, float wd, float ht){
    this.x = xp;
    this.y = yp;
    this.w = wd;
    this.h = ht;
  }
}
