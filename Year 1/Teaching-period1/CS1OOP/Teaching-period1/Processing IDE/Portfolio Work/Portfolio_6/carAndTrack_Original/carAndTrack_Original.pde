Car car; //<>//
RaceTrack track;
boolean raceOver;

void setup() {
  size(1000, 600);
  track = new RaceTrack();
  car = new Car(track.getStartPosition(), 100, 60, color(200, 100, 100));
  raceOver = false;
}

void draw() {
  background(70);
  track.display();
  car.display();
  if (!raceOver) {
    if (car.getPosition() >= track.getFinishPosition()) {
      raceOver = true;
      println("Press 's' to restart");
    } else {
      car.move();
    }
  }
}

void keyPressed() {
  if (key == 's' && raceOver) {
    float startLine = track.getStartPosition();
    car.setPosition(startLine);
    raceOver = false;
  }
}
