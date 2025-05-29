//finished portfolio 2 on 01/10/2023 at 1:57am
//I made some additions for fun (additonal code will be sandwiched with comment *)
//finished additions at 4:39am

boolean stop;
color bColour = color(255, 0, 0);
String write = "STOP";

float box_x = 50;                   // *
float box_y = 50;
float up = box_x+150;
float across = box_y+150;
int score = 0;
boolean food = false;
float food_x;
float food_y;                 // *

void setup() {
  fullScreen();
  stop = true;
}

void draw() {
  textAlign(CENTER);
  textSize(50);
  fill(0);
  background(bColour);
  text(write, width/2, height/2);
  
  if (score <=9 & !(food)) {    // *
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
  textSize(20);
  fill(0);
  text("player: "+str(across),400,400);
  text(str(up),480,400);
  text("food: "+str(int(food_x)),400,450);
  text(str(int(food_y)),480,450);
                                 //*
}

void mouseClicked() {
  if (stop) { //fell into problem here (did not read leacture slides; found solution in slides) kept using if (stop = true) {} <- did not work since no comparison made, i was asigning a variable to true as the conditon to run an if statement. Could have used ==
    bColour = color(0,255,0);
    write = "WALK";
    stop = !stop;
  } else {
    bColour = color(255,0,0);
    write = "STOP";
    stop = !stop;
  }
}
