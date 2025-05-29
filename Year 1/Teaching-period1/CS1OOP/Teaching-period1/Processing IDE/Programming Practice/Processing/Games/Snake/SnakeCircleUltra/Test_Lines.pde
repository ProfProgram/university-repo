void displayPlaytest() {
  //lines for x
  line(p.rectX, 0, p.rectX, height); // x = rectX
  stroke(255);
  line(p.rectX + (p.rectSizeX/2), 0, p.rectX + (p.rectSizeX/2), height); //x = rectX + half rectSizeX
  line(p.rectX - (p.rectSizeX/2), 0, p.rectX - (p.rectSizeX/2), height); //x = rectX - half rectSizeX
  stroke(0);

  //lines of y
  line(0, p.rectY, width, p.rectY); // y = rectY
  stroke(255);
  line(0, p.rectY + (p.rectSizeY/2), width, p.rectY + (p.rectSizeY/2));  //y = rectY + half rectSizeY
  line(0, p.rectY - (p.rectSizeY/2), width, p.rectY - (p.rectSizeY/2));  //y = rectY - half rectSizeY
  stroke(0);
}

void displayMapTest() {  //only works for map m
  //lines to RESTRICT PLAYRER to MAP
  // x
  stroke(0);
  line(m.map_x, 0, m.map_x, height);  // x = m.map_x
  stroke(255);
  line(m.map_x + (m.mapSizeX/2), 0, m.map_x + (m.mapSizeX/2), height);
  line(m.map_x - (m.mapSizeX/2), 0, m.map_x - (m.mapSizeX/2), height);
  // y
  stroke(0);
  line(0, m.map_y, width, m.map_y);
  stroke(255);
  line(0, m.map_y + (m.mapSizeY/2), width, m.map_y + (m.mapSizeY/2));
  line(0, m.map_y - (m.mapSizeY/2), width, m.map_y - (m.mapSizeY/2));
  stroke(0);
}
