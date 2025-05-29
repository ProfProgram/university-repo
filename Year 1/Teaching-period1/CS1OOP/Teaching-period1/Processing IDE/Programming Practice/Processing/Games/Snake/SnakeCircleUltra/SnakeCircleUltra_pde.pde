//PlayButton Declare
pButton p;

//MAP Declare
Map m;

//Player Declare
Player pl;

//FOOD Declare
Food f;

//SCORE
Score s;

void setup()
{
  //canvas
  size(1000, 1000);

  //PlayButton Inital
  p = new pButton();

  //Map Initial
  m = new Map();

  //Player Inital
  pl = new Player();

  //FOOD Intial
  f = new Food();
  
  //Score Inital
  s = new Score();
}

void draw()
{
  //TITLE - Pre-play
  drawText(75, color(255), CENTER, "SNAKE CIRCLE ULTRA", width/2, height/10);

  p.display();
  p.isClicked();
  
  //displayPlayTest();

  if (p.play)
  {
    background(100);
    //ellipse(mouseX, mouseY, 30, 30);    //used to test if background runs perpetually

    //TITLE - Post-play
    drawText(75, color(255), CENTER, "SNAKE CIRCLE ULTRA", width/2, height/10);

    //Map
    m.display();

    //SCORE COUNTER //<>//
    s.display();

    //IF SCORE = MAX_SCORE
    s.maxScore();
    
    //displayMapTest();
    
    //FOOD - spawn and eating
    f.spawn();
    f.eating();

    //Player - shown and moving
    pl.display();
    pl.movement();

    //Co-ordinates
    pl.location(); //Player location
    f.location();  //Food location
    
    // Player dying & GAME OVER
    m.checkEdges();
  }
}
