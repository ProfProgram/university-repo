class Screen {
  float x;
  float y;
  float w;
  float h;
  //int num1;
  //int num2;
  //char oper;
  //float ans;
  String label;

  public Screen(float xp, float yp, float wd, float ht) {
    this.x = xp;
    this.y = yp;
    this.w = wd;
    this.h = ht;
    label="";
  }

  public String getText() {
    return label;
  }

  public <T> void appendText(T apnd) {
    this.label += apnd;
  }
  
  public void setText(String s) {
    this.label = s;
  }

  public void clearLabel() {
    this.label = "";
  }

  //public void setNum1(String s) {
  //  this.num1 = int(s);
  //}

  //public int getNum1() {
  //  return this.num1;
  //}
  
  //public String getNum1_s() {
  //  return str(num1);
  //}

  //public void setNum2(String s) {
  //  this.num2 = int(s);
  //}

  //public int getNum2() {
  //  return this.num2;
  //}

  //public void setOp(char s) {
  //  this.oper = s;
  //}

  //public char getOp() {
  //  return this.oper;
  //}

  public void display() {
    fill(0);
    stroke(255);
    rect(x, y, w, h);
    fill(255);
    textAlign(CENTER, CENTER);
    textSize(30);
    text(label, x+w/2, y+h/2);
  }
}
