int cols, rows;
int scl = 20;
int w = width*100;
int h = height*25;

float flying = 0;

float[][] terrain;

void setup() {
  size(600, 600, P3D);//makes 3D envionment
  cols = w / scl;
  rows = h / scl;
  terrain = new float[cols][rows];
  frameRate(144);
}

void draw() {

  flying -= 0.1;

  float yoff = flying;
  for (int y = 0; y < rows; y++) {
    float xoff = 0;
    for (int x = 0; x < cols; x++) {
      terrain[x][y] = map(noise(xoff, yoff), 0, 1, 0, 100);
      xoff += 0.1;
    }
    yoff += 0.05;
  }


  background(#FAD6A5);
  stroke(255);
  fill(0, 255, 255);


  translate(width/2, height/2);
  rotateX(PI/2.6);

  translate (-w/2, -h/2);
  for (int y = 0; y < rows-1; y++) {
    beginShape(TRIANGLE_STRIP);
    for (int x = 0; x < cols; x++) {
      vertex(x*scl, y*scl, terrain[x][y]);
      vertex(x*scl, (y+1)*scl, terrain[x][y+1]);
      //rect(x*scl, y*scl, scl, scl);
    }
    endShape();
  }
}
