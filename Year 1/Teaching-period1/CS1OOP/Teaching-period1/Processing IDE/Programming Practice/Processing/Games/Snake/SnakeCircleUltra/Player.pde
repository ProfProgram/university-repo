class Player {

  //PLAYER
  int player_x;    //player x and y
  int player_y;
  color player_colour;  //player colour
  int pTextCo;          //player Co-ordiante text Size
  int playerSize;

  Player() {
    //PLAYER - Should start in middle of map
    player_x = m.map_x;
    player_y = m.map_y;
    player_colour = color(255, 255, 0);
    pTextCo = 20;
    playerSize = 30;
  }

  void display() {
    //PLAYER
    stroke(0);
    fill(player_colour);
    ellipse(player_x, player_y, playerSize, playerSize);
  }

  void movement() {
    //if statement to check if player should move yet/now
    //unintended feature - snake moves forever in direction of last key
    if (p.play && s.score != s.max_score)
    {
      if (key == 'w' || key == 'W')
      {
        if (player_y > m.map_y - (m.mapSizeY/2) + (playerSize/2))
        {
          player_y--;  //moves player up
        }
      } else if (key == 'a' || key == 'S')
      {
        if (player_x > m.map_x - (m.mapSizeX/2) + (playerSize/2))
        {
          player_x--;  //moves player left
        }
      } else if (key == 's' || key == 'S')
      {
        if (player_y < m.map_y + (m.mapSizeY/2) - (playerSize/2))
        {
          player_y++;  //moves player down
        }
      } else if (key == 'd' || key == 'D')
      {
        if (player_x < m.map_x + (m.mapSizeX/2) - (playerSize/2))
        {
          player_x++;  //moves player right
        }
      }
    }
  }
  void location() {
    //Co-ordinates
    textSize(pTextCo);
    textAlign(LEFT);
    fill(0);
    text("Player:\nX: "+str(player_x)+ "\nY: " +str(player_y), m.map_x - (m.mapSizeX/2), m.map_y + (m.mapSizeY/2) + pTextCo);  //Player co-ordinates
  }

  void gone() {
   playerSize = 0;
  }
}
