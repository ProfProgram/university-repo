// Make back button for bCalc;
/*
Notes;
 -  '=' button will calc and save current calc;
 -  screen.getText() will be calc
 - going to make 3 screens with 3 different strings that way its easier
 */


import java.util.ArrayList;
import java.util.Optional;

public String[] prevCals = new String[5];

// ArrayList used to read from txt file since unknown num of lines in txt file
public ArrayList<String> line;

// Screen state
int state = 0;
int pState = state;

// Buttons for menu
Button basic;
Button adv;
Button back;

// Screen
Screen[] bScreens = new Screen[3];
Screen fScreen;

// Buttons for basic
Button[] numbers = new Button[10];
Button[] op = new Button[6];
String[] opNames = {"+", "-", "*", "/", "=", "Del"};
//Button done;

// calc vals;
int num1;
int num2;
char oper;
float ans;

boolean opPressed = false;

void setup() {
  size(600, 600);
  line = new ArrayList<>();

  for (int index = 0; index < prevCals.length; index++) {
    prevCals[index] = (index+1) + ". \n";
  }
  // Basic Buttons
  for (int i=0; i < numbers.length; i++) {
    int xPos = (i+1) * 50;
    numbers[i] = new Button(xPos, height/2 +10, 50, 50);
    numbers[i].setText(str(i));
  }
  for (int i=0; i < op.length; i++) {
    int xPos = (i+1) * 50;
    op[i] = new Button(xPos, height/2 +60, 50, 50);
    op[i].setText(opNames[i]);
  }

  //done = new Button(width/2 - 50, height/2 + 60, 100, 50);
  //done.setText("Done");

  basic = new Button(width/2 - 125, height/2 -50, 100, 50);
  basic.setText("basic");


  adv = new Button(width/2 + 25, height/2 - 50, 100, 50);
  back = new Button(10, 10, 100, 50);
  adv.setText("adv");
  back.setText("back");

  for (int i = 0; i < bScreens.length; i++) {
    bScreens[i] = new Screen(50 + (i*175), height/2 - 50, 150, 50);
  }
  fScreen = new Screen(width/2 - 75, height/2 - 110, 150, 50);
  //bScreen = new Screen(50, height/2 - 50, 500, 50);

  writePrevCalcs();
  readPrevCalcs();
  /*
  Example of how to change a txt files specific line
   example changes line 1 of file, current file is limited to prevCals.length - Only has 5 lines or prevCals[4]
   */
  //prevCals[0] = 0 + ". loop \n";
  //writePrevCalcs();
  //readPrevCalcs();
}

void draw() {
  background(255);
  //line(0, height/2, width, height/2);
  //line(width/2, 0, width/2, height);
  if (state == 0) {
    basic.display();
    adv.display();
    bScreens[0].clearLabel();
    bScreens[1].clearLabel();
    bScreens[2].clearLabel();
    fScreen.clearLabel();
    opPressed = false;
  } else if (state == 1) {              // state 1
    pState = 0;
    //line(0, height/2, width, height/2);
    //line(width/2, 0, width/2, height);
    for (Button button : numbers) {
      button.display();
    }
    back.display();
    for (Screen s : bScreens) {
      s.display();
    }
    fScreen.display();
    //done.display();
    for (Button button : op) {
      button.display();
    }                               //
  } else if (state == 3) {          // state 3
    pState = 1;
    for (Button button : op) {
      button.display();
    }
    back.display();
    for (Screen s : bScreens) {
      s.display();
    }
    fScreen.display();
    //done.display();               //
  } else if (state == 4) {          // state 4
    pState = 3;
    for (Button button : numbers) {
      button.display();
    }
    back.display();
    for (Screen s : bScreens) {
      s.display();
    }
    fScreen.display();
    //done.display();              //
  } else if (state == 5) {         // state 5
    pState = 4;
    for ( Button button : op) {
      button.display();
    }
    back.display();
    for (Screen s : bScreens) {
      s.display();
    }
    fScreen.display();
    //done.display();              //
  } else if (state == 2) {         // state 2
    textAlign(CENTER, CENTER);
    textSize(30);
    text("NOT IMPLEMENTED YET", width/2, height/2);
    back.display();
    pState = 0;
  }
}

void mousePressed() {
  if (basic.isInside(mouseX, mouseY) && state == 0) {
    state = 1;
  }
  if (adv.isInside(mouseX, mouseY) && state == 0) {
    state = 2;
  }
  if (back.isInside(mouseX, mouseY)) {
    state = pState;
  }
  for (int index = 0; index < numbers.length && state == 1 && opPressed == false; index++) {      // num1 numbers (do if opPressed == false)
    if (numbers[index].isInside(mouseX, mouseY)) {
      bScreens[0].appendText(index);
    }
  }
  for (int index = 0; index < numbers.length && state == 1 && opPressed == true; index++) {      // num2 numbers  (do if opPressed == true)
    if (numbers[index].isInside(mouseX, mouseY)) {
      bScreens[2].appendText(index);
    }
  }
  //if (done.isInside(mouseX, mouseY) && state == 1) {              // Done buttons
  //  num1 = int(bScreens[0].getText());
  //  pState = 1;
  //  state = 3;
  //} else if (done.isInside(mouseX, mouseY) && state == 3) {
  //  oper = bScreens[1].getText().charAt(0);
  //  pState = 3;
  //  state = 4;
  //} else if (done.isInside(mouseX, mouseY) && state == 4) {      //
  //  num2 = int(bScreens[2].getText());
  //  pState = 4;
  //  state = 5;
  //}
  for (int index = 0; index < 4 && state == 1 && !opPressed; index++) {    // operator buttons
    if (op[index].isInside(mouseX, mouseY)) {
      opPressed = true;
      bScreens[1].appendText(op[index].getText());
    }
  }
  // del button on:
  //state 3
  if (op[5].isInside(mouseX, mouseY) && state == 1) {    // 'Del' button
    bScreens[1].clearLabel();
    opPressed = false;
  }
  if (op[4].isInside(mouseX, mouseY) && state == 1) {    // '=' button
    num1 = int(bScreens[0].getText());
    oper = bScreens[1].getText().charAt(0);
    num2 = int(bScreens[2].getText());    
    
    if (oper == '+') {
      ans = num1 + num2;
    } else if (oper == '-') {
      ans = num1 - num2;
    } else if (oper == '*') {
      ans = num1 * num2;
    } else if (oper == '/') {
      ans = num1 / num2;
    }

    String calc = "%s %s %s = %s".formatted(num1, oper, num2, ans);
    prevCals[0] = 1 + ". " + calc +"\n";
    writePrevCalcs();

    fScreen.appendText(ans);
  }
}
