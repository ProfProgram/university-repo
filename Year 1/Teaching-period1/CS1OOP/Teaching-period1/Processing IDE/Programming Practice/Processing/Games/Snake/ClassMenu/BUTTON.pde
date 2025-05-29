class Button {

  //PLAY BUTTON
  boolean clicked; //play button boolean
  boolean pressed; // if mouse if pressed
  float buttonX, buttonY;  //pay button x and y
  float buttonSizeX, buttonSizeY;    //size of play button
  boolean rectOver;     //tracks if mouse button is over play button
  color buttonColour;   // button colour

  Button() {    //default
    clicked = false;
    pressed = false;
    buttonSizeX = 100;
    buttonSizeY = 50;
    buttonX = width/2;
    buttonY = height/2;
    buttonColour = color(0);
  }

  //construct button size different SizeX and SizeY
  Button(float buttonX, float buttonY, float buttonSizeX, float buttonSizeY, color buttonColour) {
    clicked = false;
    this.buttonX = buttonX;
    this.buttonY = buttonY;
    this.buttonSizeX = buttonSizeX;
    this.buttonSizeY = buttonSizeY;
    this.buttonColour = buttonColour;
  }

  //construct button size same SizeX and SizeY
  Button(float buttonX, float buttonY, float buttonSize, color buttonColour) {
    clicked = false;
    this.buttonX = buttonX;
    this.buttonY = buttonY;
    this.buttonSizeX = buttonSize;
    this.buttonSizeY = buttonSize;
    this.buttonColour = buttonColour;
  }

  // draw entire button
  void drawWholeButton(float tSize, color tFill, String text) {
    drawButton();
    drawText(tSize, tFill, text);
  }

  // drawing Text inside button
  void drawText(float tSize, color tFill, String text) {

    textSize(tSize);

    fill(tFill);
    textAlign(CENTER, CENTER);
    text(text, buttonX + buttonSizeX/2, buttonY + buttonSizeY/2);
  }

  // drawing button
  void drawButton() {
    fill(buttonColour);
    stroke(255);
    rect(buttonX, buttonY, buttonSizeX, buttonSizeY);
  }

  void update() {
    if (mousePressed && mouseButton == LEFT && pressed == false) {  // fixes bug where new button disappears after any button is pressed
      pressed = true;
      if (mouseX >= buttonX && mouseX <= buttonX + buttonSizeX && mouseY >= buttonY && mouseY <= buttonY + buttonSizeY) {
        clicked = true;
      } else {
        clicked = false;
        pressed = false;
      }
    }
  }

  boolean isClicked() {
    return clicked;
  }
  boolean isPressed() {
    return pressed;
  }


  void removeButton(Button name) {
    name.buttonX = -1000;
    name.buttonY = -1000;
    name.buttonSizeY = 0;
    name.buttonSizeX = 0;
    name.clicked = true;
  }
}
