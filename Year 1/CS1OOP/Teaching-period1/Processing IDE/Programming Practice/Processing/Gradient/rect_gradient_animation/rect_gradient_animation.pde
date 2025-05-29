void setup()
{
  fullScreen();
}

float w = 4; //rectangle width

void draw()
{
  background(0);
  //gradient consisting of rectangles
  for(int i=0; i<width; i+=w)
  {
    rect(i, 0, w, height);
  }
}
