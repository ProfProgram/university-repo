class Food {

  //FOOD
  boolean food;    //tracks for food on screen
  int food_x;      //food x and y
  int food_y;
  color food_colour;  //food colour
  int fTextCo;        //food Co-ordinate Text Size
  int foodSize;

  Food() {
    //FOOD
    food = false;
    food_colour = color(0, 0, 255);
    fTextCo = 20;
    foodSize = 25;
  }

  void spawn() {

    //if no food on screen and max_score not reached
    if (s.score < s.max_score & !food)
    {
      food_x = int(random(float(m.map_x - (m.mapSizeX/2) + (pl.playerSize/2)), float(m.map_x + (m.mapSizeX/2) - (pl.playerSize/2))));
      food_y = int(random(float(m.map_y - (m.mapSizeY/2) + (pl.playerSize/2)), float(m.map_y + (m.mapSizeY/2) - (pl.playerSize/2))));
      //ellipse(food_x, food_y, foodSize, foodSize);  //TESTING where FOOD SPAWNS
      food = true;
    }
    //spawns food when food_x and food_y have been randomized
    if (food)
    {
      stroke(0);
      fill(food_colour);
      ellipse(food_x, food_y, foodSize, foodSize);
    }
  }

  void eating() {
    if (food & (dist(pl.player_x, pl.player_y, food_x, food_y) < (pl.playerSize/2) + (foodSize/2) & s.score < s.max_score))
    {
      food = false;
      s.score++;
    }
  }
  void location() {
    textSize(fTextCo);
    textAlign(LEFT);
    fill(0);
    text("Food:\nX: "+str(food_x)+ "\nY: " +str(food_y), m.map_x - (m.mapSizeX/2) + (100), m.map_y + (m.mapSizeY/2) + fTextCo); //Food co-ordinates
  }
}
