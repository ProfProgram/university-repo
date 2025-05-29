Car[] cars; //<>//
RaceTrack track;
boolean raceOver;

public int numCars;

int startY;
int spacing;

void setup() {
  size(1000, 600);
  track = new RaceTrack();
  numCars = 10;
  cars = new Car[numCars];

  // Calculating spacing based on canvas height and num of cars
  spacing = height / (numCars + 1);
  startY = spacing;  // done so that spacing is done from top down

  for (int count = 0; count < cars.length; count++) {
    cars[count] = new Car(track.getStartPosition(), 100, 60, color(200, 100, 100));
  }

  spaceOutCarsYAxis();

  raceOver = false;
}

void draw() {
  background(70);
  track.display();
  // can also be written for (Car car: cars) { car.display();}
  for (int count = 0; count < cars.length; count++) {
    cars[count].display();
  }
  if (!raceOver) {
    for (Car car : cars) {
      if (car.getPosition() >= track.getFinishPosition()) {
        //car.score++;
        raceOver = true;
        car.setCrossedFinish(true);
        //car.detectOneWinner();
        println("Press 's' to restart");
      } else if (car.getPosition() <= track.getFinishPosition()) {
        for (int i = 0; i < cars.length; i++) {
          cars[i].move();
        }
      }
    }
  }
  detectWinners();
  //for (Car car : cars) {
  //  car.detectOneWinner();
}
//println(str(cars[0].score));
void spaceOutCarsYAxis() {
  int currentY = startY;

  for (Car car : cars) {
    car.setY(currentY);
    currentY += spacing;
  }
}

void keyPressed() {
  if (key == 's' && raceOver) {
    float startLine = track.getStartPosition();
    for (int count = 0; count < cars.length; count++) {
      cars[count].setPosition(startLine);
    }
    raceOver = false;
  }
}

void detectWinners() {
  for (Car car : cars) {
    if (car.hasCrossedFinish() && !raceOver) {
      car.increaseScore();
      raceOver = true;
    }
  }
}
