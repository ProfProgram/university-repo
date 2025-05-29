//import java.util.HashMap.size;

String t = "Lorem ipsum dolor sit amet, consectetur\nadipiscing elit, sed do eiusmod tempor\nincididunt ut labore et dolore magna aliqua.\nEget nunc lobortis\nmattis aliquam faucibus.";
String[] stylenames = {"dark", "light", "red", "blue"};
StyleCollection styles;
Style currentStyle;
Button[] buttons;

public void setupStyles() {
  styles = new StyleCollection();
  Style dark = new Style("dark", color(0), color(0), color(255), 24);
  Style light = new Style("light", color(255), color(0), color(0), 24);
  Style red = new Style("red", color(#F0ACAC), color(255, 0, 0), color(255, 0, 0), 24);
  Style blue = new Style("blue", color(#B1A9E8), color(0, 0, 255), color(0, 0, 255), 24);
  styles.addStyle(dark);
  styles.addStyle(light);
  styles.addStyle(red);
  styles.addStyle(blue);
  currentStyle = styles.getStyle("dark");
  styles.setDefaultStyle(currentStyle);
}

public void setupButtons() {
  buttons = new Button[stylenames.length];
  //buttons = new Button[styles.size()];
  int spacing  = width / 5;
  /*
  when i use stylenames.length + 1 instead of 5 it removes blue button for some reason
  although using println(button[3].label) will print blue meaning that the blue buttons exists it does not show even when I use fullScreen();
  using println(button[3].x) i can tell why; the x co-ordinate of blue button is outside the width at all times.
  this does not happen when i use 5 which is == stylenames.length+1
  the only issue i have with this code is that i cannot make the buttons on screen spaced out evenly no matter the number of buttons in the array
  I resported to using the stylenames.length method since styles.size() would not work (issue being size() did not exits)
  */
  for (int index = 0; index<buttons.length; index++) {
    float xPos = (index + 1) * spacing;
    buttons[index] = new Button(xPos, height - 100, 100, 75);
    buttons[index].setText(stylenames[index]);
  }
}

void setup() {
  size(800, 600);
  setupStyles();
  setupButtons();
}

void draw() {
  background(currentStyle.getBackground());
  fill(currentStyle.getFillColor());
  stroke(currentStyle.getStrokeColor());
  textAlign(CENTER, CENTER);
  textSize(currentStyle.getTextSize());
  text(t, width/2, height/2);
  
  for (int index = 0; index < buttons.length; index++) {
    buttons[index].display(styles);
  }
  //println( 5 == stylenames.length +1);
}

void mousePressed() {
  for (Button button : buttons) {
    if (button.isInside(mouseX, mouseY)) {
      currentStyle = styles.getStyle(button.label);
    }
  }
}
