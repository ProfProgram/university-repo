// Start Time 13:31 19/10/2023
// Finish Time
// Current Attempt (on new sketch) = 2
// current bug - works as intended right now
// next implement - Volume functionality (adding sound and a volume slider/value settings)

//Main buttons
Button play;
Button back;
Button settings;
Button exit;


// settings buttons
Button volume;

//screenState
int screenState;
int pScreenState;

void setup() {
  size(500, 500);
  
  //initial screenState
  screenState = 0;
  pScreenState = screenState;
  
  // MAIN BUTTONS
  // play
  play = new Button(width/2 - 50, height/2 - 25, 100, 50, color(0));
  play.setLabel("Play", color(255));
  
  // back
  back = new Button(width/2 - 50, height/2 - 85, 100, 50, color(0));
  back.setLabel("Back", color(255));
  
  // settings
  settings = new Button(width/2 -50, height/2 + 30, 150, 50, color(0));
  settings.setLabel("Settings", color(255));
  
  // exit
  exit = new Button(width/2 -50, height/2 + 85, 100, 50, color(0));
  exit.setLabel("EXIT", color(255));
  
  // SETTINGS BUTTONS
  // volume
  volume = new Button(width/2 - 50, height/2 - 25, 100, 50, color(0));
  volume.setLabel("Volume", color(255));
}

void draw() {
  background(100);
  if (screenState == 0) {
    play.display();
    settings.display();
    exit.display();
  }
  if (screenState == 1) {
    back.display();
  }
  if (screenState == 2) {
    back.display();
    volume.display();
  }
}

void mousePressed() {
  if (play.isInside(mouseX, mouseY) && screenState == 0) {
    pScreenState = screenState;
    screenState = 1;
    println("play");
  }  // activates both buttons at same time;
  if (back.isInside(mouseX, mouseY)) {
    screenState = pScreenState;
    println("screen went back");
  }
  if (settings.isInside(mouseX, mouseY) && screenState == 0) {
    pScreenState = screenState;
    screenState = 2;
    println("inside settings");
  }
  if (exit.isInside(mouseX, mouseY) && screenState == 0) {
    exit();
  }
  if (volume.isInside(mouseX, mouseY) && screenState == 2) {
    println("volume has been clicked");
  }
}
