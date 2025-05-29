public void update_buttons(Button b1, Button b2, Button b3, Button b4) {
  b1.update();
  b2.update();
  b3.update();
  b4.update();
}

public void screenState() {
  // What screen will be like when screenState == x;
  if (screenState == 0) {
    play.drawWholeButton(30, 255, "PLAY");

    settings.drawWholeButton(30, 255, "SETTINGS");

    Exit.drawWholeButton(30, 255, "EXIT");
  }
  // no need to remove buttons acts like a for/while loop
  else if (screenState == 1) {
    // screenState for playing game
    back.drawWholeButton(30, 255, "BACK");
  } else if (screenState == 2) {
    // screenState for settings screen
    back.drawWholeButton(30, 255, "BACK");
  }

  // Changing screen state if buttons are pressed;
  if (play.isClicked()) {
    pScreenState = screenState;
    screenState = 1;
  } else if (settings.isClicked()) {
    pScreenState = screenState;
    screenState = 2;
  } else if (Exit.isClicked()) {
    //should stop program execution, result is the same as pressing the red cross of window
    exit();
  } else if (back.isClicked()) {
    screenState = pScreenState;
    exit();  // using exit to test if clicking functionality is working
  }
}
