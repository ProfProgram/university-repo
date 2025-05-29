class Map {

  //MAP
  int map_x;    //map x and y
  int map_y;
  int mapSizeX;    //map width and height
  int mapSizeY;
  color map_colour;  //map colour
  
  Map() {
    //MAP (USE RECTMODE(CENTER))
    map_x = width/2;
    map_y = height/2;
    mapSizeX = 500;
    mapSizeY = 500;
    map_colour = color(0, 255, 0);
  }

  void display() {
    //MAP
    rectMode(CENTER);
    fill(map_colour);
    rect(map_x, map_y, mapSizeX, mapSizeY);
    rectMode(LEFT);
    noFill();
  }
  
  void checkEdges() {
    if (pl.player_x >= map_x + (mapSizeX/2) || pl.player_x <= map_x - (mapSizeX/2) || pl.player_y >= map_y + (mapSizeY/2) || pl.player_y <= map_y - (mapSizeY/2)) {
      pl.gone();
    }
  }
}
