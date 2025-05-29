//current Task: 'PLAY' button
//current Bug: can play without button pressed

float box_x = 50;
float box_y = 50;
float up = box_x+150;
float across = box_y+150;
int score = 0;
boolean food = false;
float food_x;
float food_y;

int rectX, rectY;
int rectSizeX = 100;
int rectSizeY = 50;
color rectHighlight;
boolean rectOver = false;
color rect_c = color(255,255,255,255);
boolean play = false;

void setup() {
  size(600, 600);
  rectHighlight = color(51);
  rectX = int(box_x+150);
  rectY = int(box_y+150);
}

void draw() {
  textAlign(CENTER);
  background(255);
  textSize(20);
  fill(0);
  text("player: "+str(across),400,400);
  text(str(up),480,400);
  text("food: "+str(int(food_x)),400,450);
  text(str(int(food_y)),480,450);
  
  line(box_x,box_y,50,350);          //box is 350x350
  line(50,50,350,50);
  line(350,50,350,350);
  line(50,350,350,350);
  
  update(mouseX, mouseY);
  if (play == true) {
    if (score <=9 & !(food)) {
      food_x = random(66,336);
      food_y = random(66,336);
      food = true;
    }
    if (food) {
      stroke(0);
      fill(0,0,255);
      ellipse(int(food_x),int(food_y),20,20);
    }
    if (score < 10) {
      fill(0);
      text(str(score), 400, 60);
    }else {
      fill(0);
      textAlign(LEFT);
      text("congradulations",400,60);
    }
    stroke(0);
    fill(#D8BA67);
    ellipse(across, up, 30, 30);
    if (keyPressed) {                 //does not accept multiple keys pressed at same time
      if (key == 'w' || key == 'W') {
        if (up != 65) {
          up--;
        }
      }else if (key == 's' || key == 'S') {
        if (up != 335) {
          up++;
        }
      }else if (key == 'd' || key == 'D') {
        if (across != 335) {
          across++;
        }
      }else if (key == 'a' || key == 'A') {
        if (across != 65) {
          across--;
        }
      }
    }
    if (food & (dist(across, up, int(food_x), int(food_y)) < 15 + 10) & score < 10) {
      food = false;
      score++;
    }
    }
    if (score <=9 & !(food)) {
      food_x = random(66,336);
      food_y = random(66,336);
      food = true;
    }
    if (food) {
      stroke(0);
      fill(0,0,255);
      ellipse(int(food_x),int(food_y),20,20);
    }
    if (score < 10) {
      fill(0);
      text(str(score), 400, 60);
    }else {
      fill(255,255,255);
      text("congradulations",600,60);
    }
    stroke(0);
    fill(#D8BA67);
    ellipse(across, up, 30, 30);
    line(box_x,box_y,50,350);          //box is 350x350
    line(50,50,350,50);
    line(350,50,350,350);
    line(50,350,350,350);
    if (keyPressed) {                 //does not accept multiple keys pressed at same time
      if (key == 'w' || key == 'W') {
        if (up != 65) {
          up--;
        }
      }else if (key == 's' || key == 'S') {
        if (up != 335) {
          up++;
        }
      }else if (key == 'd' || key == 'D') {
        if (across != 335) {
          across++;
        }
      }else if (key == 'a' || key == 'A') {
        if (across != 65) {
          across--;
        }
      }
    }
    if (food & (dist(across, up, int(food_x), int(food_y)) < 15 + 10) & score < 10) {
      food = false;
      score++;
  }
  
  //'PLAY' button
  fill(0);
  rectMode(CENTER);
  rect(rectX,rectY,100,50);
  fill(255);
  textSize(30);
  text("PLAY", rectX,rectY+10);
}

void update(int x, int y) {
 if ( overRect(rectX, rectY, rectSizeX, rectSizeY)) {
   rectOver = true;
 }else {
  rectOver = false; 
 }
}

void mousePressed() {
 if (rectOver) {  //move rect and text off canvas
   rectX = -100;
   rectY = -100;
   play = true;
 }
}

boolean overRect(int x, int y, int width, int height) {
  if (mouseX >= x && mouseX <= x+width && mouseY >= y && mouseX <= y+height) {
   return true; 
  }else {
    return false;
  }
}
