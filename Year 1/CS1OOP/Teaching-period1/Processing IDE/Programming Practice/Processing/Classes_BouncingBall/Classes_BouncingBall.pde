Ball b1;
Ball b2;

void setup() {
  size(600, 600);
  b1 = new Ball();
  b2 = new Ball();
}

void draw() {
  background(255);
  b1.displayBall();
  b1.moveBall();
  b1.checkEdges();

  b2.displayBall();
  b2.moveBall();
  b2.checkEdges();

  //hit-box for Ball b1
  //stroke(255,0,0);
  //noFill();
  //rect(b1.x - b1.ballS/2, b1.y - b1.ballS/2, b1.ballS, b1.ballS);
  if (b1.overlaps(b2) || b2.overlaps(b1)) {
    b1.gone();
    b2.gone();
  }
}

void mousePressed() {
  if (mouseX >= b1.x - b1.ballS/2 && mouseX <= b1.x + b1.ballS && mouseY >= b1.y - b1.ballS/2 && mouseY <= b1.y + b1.ballS/2) {
    b1.gone();
  }
  if (mouseX >= b2.x - b2.ballS/2 && mouseX <= b2.x + b2.ballS && mouseY >= b2.y - b2.ballS/2 && mouseY <= b2.y + b2.ballS/2) {
    b2.gone();
  }
}
