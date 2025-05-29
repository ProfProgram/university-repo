Flower[] flowers;
Sun sun;

int flowerCount = 3;

void setup() {
  size(800, 600);
  //flower = new Flower(300, 400);
  flowers = new Flower[flowerCount];
  for (int count = 0; count < flowerCount; count++) {
    flowers[count] = new Flower(300, 400);
  }
  sun = new Sun(600, 150);
}

void draw() {
  background(200, 200, 250);
  sun.display();
  for (int count = 0; count < flowerCount; count++) {
    flowers[count].display();
    flowers[count].grow();
  }
  // find out if the flower is at its maximum height
  for (int count = 0; count < 2; count++) {
    boolean inBloom1 = flowers[count].isMaxHeight();
    sun.setSmiling((inBloom1));
  }
  // the sun smiles when the flower is at its maximum height
  //sun.setSmiling((inBloom1));
}
