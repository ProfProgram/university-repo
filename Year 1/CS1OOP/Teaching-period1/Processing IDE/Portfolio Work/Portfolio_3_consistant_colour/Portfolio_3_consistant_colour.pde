// the number of rows to drwa
int numRows;
// the number of rectangles in the starting (bottom) row
int rowLength;
// the X coordinate of the first rectangle in the bottom row
int startX;
// the Y coordinate of the first rectangle in the bottom row
int startY;
// the width of each rectangle
int rectWidth;
// the height of each rectangle
int rectHeight;
// when isColour is false, all rectangles are filled in white
// otherwise a random fill collour is chosen
boolean isColour;

//int rowElev = 0;

void setup() {
  size(900, 400);
  stroke(0); // pen colour black
  numRows = 1; // initially one row of rectangles is drawn
  // in order to have step 4 of the protfolio work as stated have to change numRows = 1 into = 0
  // what is stated = "after the mouse is pressed 3 times, numRows should equal 3" <- going by what task 5 says I will assume that this was mistyped
  rowLength = 10; // 10 rectangles in the first row
  startX = 50;
  startY = 350;
  rectWidth = 75; // each rectangle is 75 pixels wide
  rectHeight = 30; // each rectanle 30 pixels wide
  isColour = false; // no colour to start with
}

void draw() {
  background(255);
  // don't chnage the line above
  background(100);
  int colY = startY;
  int rowElev =-1;
  int rowStart = -rectWidth/2;
  for (int counter = 0; numRows > counter; counter++) {
    colY -= rectHeight;
    rowElev++;
    rowStart += rectWidth/2;
    for (int rowX = startX; rowLength - rowElev> rowX / rectWidth; rowX += rectWidth) {
      rect(rowX + rowStart, colY, rectWidth, rectHeight);
    }
  }
}

void mousePressed() {
  int count = 0;
  boolean even = true;
  if (numRows < 10) {
    numRows++;
    count++;
  } else {
    numRows = 0;
    isColour = !isColour;
  }
  float r;
  float g;
  float b;
  
  if  (count % 10 == 0) {
    even = !even;
  }
  if (isColour && !even) {
    r = random(256);
    g = random(256);
    b = random(256);
    fill(r, g, b);
  } else if (!isColour) {
    fill(255);
  }
}
