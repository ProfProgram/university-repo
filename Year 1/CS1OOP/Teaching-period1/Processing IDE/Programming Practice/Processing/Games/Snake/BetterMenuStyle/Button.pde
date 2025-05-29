class Button {
  float x;
  float y;
  float w;
  float h;
  color c;
  String label;
  color tC;
  int bOutline;

  public Button(float xp, float yp, float wd, float ht, color c) {
    this.x = xp;
    this.y = yp;
    this.w = wd;
    this.h = ht;
    this.c = c;
    this.tC = 0;
  }

  public Button(float xp, float yp, float s, color c) {
    this.x = xp;
    this.y = yp;
    this.w = s;
    this.h = s;
    this.c = c;
    this.tC = 0;
  }

  public float getX() {
    return x;
  }
  
  public void setX(float xp) {
    this.x = xp;
  }

  public float getY() {
    return y;
  }
  
  public void setY(float yp) {
    this.y = yp;
  }

  public float getW() {
    return w;
  }
  
  public void setW(float wd) {
    this.w = wd;
  }

  public float getH() {
    return h;
  }
  
  public void setH(float ht) {
    this.h = ht;
  }

  public void display() {
    fill(c);
    stroke(255);
    if (bOutline > 0) {
      stroke(bOutline);
    }
    rect(x, y, w, h);
    textAlign(CENTER, CENTER);
    textSize(30);
    fill(tC);
    text(label, x + w/2, y + h/2);
  }

  public void setLabel(String l, color c) {
    this.label = l;
    this.tC = c;
  }

  public String getLabel() {
    return label;
  }

  public void setColour(color c) {
    this.c = c;
  }

  public void setOutline(int c) {
    if (c <= 0) {
      this.bOutline = 1;
    } else if (c > 255) {
      this.bOutline = 255;
    } else {
      this.bOutline = c;
    }
  }

  public boolean isInside(float xp, float yp) {
    if (xp >= x && xp <= x + w && yp >= y && yp <= y + h) {
      return true;
    } else {
      return false;
    }
  }
  // not using these methods right now however may need them in future
  //  public void removeButton(Button name) {
  //    name.x = -1000;
  //    name.y = -1000;
  //    name.h = 0;
  //    name.w = 0;
  //  }

  //  public void resetButton(float xp, float yp, float wd, float ht) {
  //    this.x = xp;
  //    this.y = yp;
  //    this.w = wd;
  //    this.h = ht;
  //  }
}
