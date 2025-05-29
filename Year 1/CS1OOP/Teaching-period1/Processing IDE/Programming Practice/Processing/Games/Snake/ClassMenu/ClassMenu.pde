// Start Time 13:31 19/10/2023 //<>//
// Finish Time
// current bug -  back button does do anything when clicked
// next implement - Back button functionality

//Start Button For Game
Button play;

// Main menu buttons
// will eventually appear when 'esc' button is pressed - when shown will pause game
Button settings;
Button Exit;
Button back;

//screen state
int screenState;       // current screen state
int pScreenState;      // previous screen state

void setup() {
  size(500, 500);
  screenState = 0;
  pScreenState = screenState;
  play = new Button(width/2 - 50, height/2 - 25, 100, 50, color(0));
  settings = new Button(width/2 - 75, height/2 + 30, 150, 50, color(0));    // spacing of buttons = 5 pixels
  Exit = new Button(width/2 - 50, height/2 + 85, 100, 50, color(0));
  back = new Button(width/2 - 50, height/2 - 25, 100, 50, color(0));
} //<>//

void draw() {
  background(100);

  //checking for button clicks
  play.update();    //two.isClickedRemoveButton in if statement will reproduce bug
  settings.update();
  Exit.update();
  back.update();


  // What screen will be like when screenState == x; //<>//
  if (screenState == 0) {
    play.drawWholeButton(30, 255, "PLAY");

    settings.drawWholeButton(30, 255, "SETTINGS");

    Exit.drawWholeButton(30, 255, "EXIT");
  }
  // no need to remove buttons acts like a for/while loop
  else if (screenState == 1) {
    // screenState for playing game
    back.drawWholeButton(30,255, "BACK");
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
