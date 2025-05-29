Car[] cars; //<>//
RaceTrack track;
boolean raceOver;

int numCars;
int spacing;

void setup() {
  size(1000, 600);
  track = new RaceTrack();
  numCars = 5;
  cars = new Car[numCars];
  spacing = height / (numCars + 1);  // +1 creates margin at bottom
  for (int i = 0; i < cars.length; i++) {
    float yPos = (i + 1) * spacing; // as 'i' increases so does the spacing from origonal y
    // i + 1 here creates a margin at top of screen
    cars[i] = new Car(track.getStartPosition(), yPos, 60, color(200, 100, 100));
  }
  raceOver = false;
}

void draw() {
  background(70);
  track.display();
  for (Car car : cars) {
    car.display();
  }

  //if (!raceOver) {
  //  for (Car car : cars) {
  //    if (car.getPosition() >= track.getFinishPosition()) {
  //      car.increaseScore();
  //      raceOver = true;
  //      println("Press 's' to restart");
  //    } else {
  //      car.move();
  //    }
  //  }
  //}

  // the code between // * // * is using detectWinners();
  //*
  //if (!raceOver) {
  //  detectWinners();
  //  for (Car car : cars) {
  //    if (car.getPosition() < track.getFinishPosition()) {
  //      car.move();
  //    }
  //  }
  //}
  // *

  // the code between // ** // ** is using detectOneWinner();
  // **
  if (!raceOver) {
    detectOneWinner();
    for (Car car : cars) {
      if (car.getPosition() < track.getFinishPosition()) {
        car.move();
      }
    }
  }
  // **
}

void detectWinners() {
  for (Car car : cars) {
    if (car.getPosition() >= track.getFinishPosition()) {
      car.increaseScore();
      raceOver = true;
      println("Car at y position " + car.y + " has crossed finish line.");
    }
  }
}

void detectOneWinner() {
  Car[] winningCars = new Car[cars.length];
  int numWinners = 0;
  float maxDistance = -1;
  
  for (Car car : cars) {
    if (car.getPosition() >= track.getFinishPosition()) {
      float distance = car.getPosition() - track.getFinishPosition();
      
      if (distance > maxDistance) {
        maxDistance = distance;
        numWinners = 1;
        winningCars[0] = car;
      } else if (distance == maxDistance) {
        numWinners = 2;
        winningCars[1] = car;
      }
    }
  }
  
  if (numWinners == 1) {
    raceOver = true;
    winningCars[0].increaseScore();
    println("Car at y position " + winningCars[0].y + " has won!");
  }
}

void keyPressed() {
  if (key == 's' && raceOver) {
    float startLine = track.getStartPosition();
    for (Car car : cars) {
      car.setPosition(startLine);
    }
    raceOver = false;
  }
}
