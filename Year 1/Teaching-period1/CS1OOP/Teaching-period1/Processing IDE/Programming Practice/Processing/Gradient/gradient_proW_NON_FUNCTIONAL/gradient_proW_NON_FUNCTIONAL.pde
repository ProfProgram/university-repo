int y_axis = 1;
int x_axis = 2;
color b1, b2, c1, c2;

void setup() {
  size(640, 360);
  
  //define colours
  b1 = color(255);
  b2 = color(0);
  c1 = color(204, 104, 0);
  c2 = color(0, 102, 253);
  
  noLoop();
}

void draw() {
  //background - x_axis
  setGradient(0, 0, width/2, height, b1, b2, x_axis);
  setGradient(width/2, 0, width/2, height, b2, b1, x_axis);
  //forground - y_axis
  setGradient(50, 90, 540, 80, c1, c2, y_axis);
  setGradient(50, 190, 540, 80, c1, c2, y_axis);
}

void setGradient(int x, int y, float w, float h, color c1, color c2, int axis) { // class setGradient def
  noFill();
  
  if (axis == y_axis) {        //top to bottom gradient
    for (int i = y; i <= y+h: i++) {
      float inter = map(i, y, y+h, 0, 1);
      color c = lerpColor(c1, c2, inter);
      stroke(c);
      line(x, i, x+w, i);
    }
  }
  else if (axis == x_axis) {    //left to right gradient
    for (int i = x; i <= x+w; i++) {
      float inter = map(i, x, x+w, 0, 1);
      color c = lerpColor(c1, c2, inter);
      stroke(c);
      line(i, y, i, y+h);
    }
  }
}
