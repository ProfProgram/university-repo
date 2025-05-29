Flower flower;
Sun sun;

void setup() {
  size(800, 600);
  flower = new Flower(300, 400);
  sun = new Sun(600, 150);
}

void draw() {
  background(200, 200, 250);
  sun.display();
  flower.display();
  flower.grow();
  // find out if the flower is at its maximum height
  boolean inBloom1 = flower.isMaxHeight();
  // the sun smiles when the flower is at its maximum height
  sun.setSmiling((inBloom1));
}
