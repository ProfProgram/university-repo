// the number of rows to drwa //<>//
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

void setup() {
  size(900, 400);
  stroke(0); // pen colour black
  numRows = 1; // initially one row of rectangles is drawn
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
  //print(numRows);
  for (int count = 1; numRows != count; count++) { //<>//
    for (int bRowStartX = startX; rowLength > bRowStartX / rectWidth; bRowStartX = bRowStartX + rectWidth) { //<>//
      fill(255);
      rect(bRowStartX, startY, rectWidth, rectHeight);
    }
  }
}

void mousePressed() {
  if (numRows < 10) { //<>//
    numRows++;
  } else { //<>//
    numRows = 0;
  } //<>//
}
