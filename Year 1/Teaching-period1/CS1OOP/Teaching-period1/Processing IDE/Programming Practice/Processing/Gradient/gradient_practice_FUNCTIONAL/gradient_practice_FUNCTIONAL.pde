size(500,500);
//fullScreen();

//variables
int r = 150;
int g = 150;
int b = 150;

int myStrokeWeight = 3;

for (int i = 0; i< height; i++) //creates variable i, = it to 0; runs the loop until i=height; increases i in increments of 1
{
  //chnage i to change colour
  stroke(r, g, i); //here i changes colour value for respective parameter
  line(0, i, width, i); //here i represents y value
  //for( int c = 100; c>0; c++) 
  {
   // stroke(i ,c, i);
    //line(0, i, width, i);
  }
}
