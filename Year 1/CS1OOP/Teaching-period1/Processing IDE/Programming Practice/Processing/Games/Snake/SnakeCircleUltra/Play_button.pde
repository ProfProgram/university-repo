class pButton {

  //PLAY BUTTON
  boolean play; //play button boolean
  int rectX, rectY;  //pay button x and y
  int rectSizeX, rectSizeY;    //size of play button
  boolean rectOver;     //tracks if mouse button is over play button

  pButton() {
    //VARIABLE ASSIGNMENT
    //PLAY BUTTON
    play = false;
    rectSizeX = 100;
    rectSizeY = 50;
    rectX = width/2;
    rectY = height/2;
  }

  void display() {
    //PLAY BUTTON - STYLE
    //rectangle
    stroke(0);
    fill(0);
    rectMode(CENTER);
    rect(rectX, rectY, rectSizeX, rectSizeY);
    rectMode(LEFT);
    //text
    fill(255);
    textSize(30);
    textAlign(CENTER);
    text("PLAY", width/2, height/2+10);
    textAlign(LEFT);
  }

  void isClicked() {
    if (mousePressed) {
      if ((mouseX >= p.rectX - (p.rectSizeX/2) && mouseX <= p.rectX + (p.rectSizeX/2)) && (mouseY >= p.rectY - (p.rectSizeY/2) && mouseY <= p.rectY + (p.rectSizeY/2)))
      {
        play = true;
        rectSizeX = 0;
        rectSizeY = 0;
        rectX = -100;
        rectY = -100;
      }
    }
  }
}
