void detect1winner() {
  float[] xPos = new float[cars.length];
  float max = xPos[0];
  
  for (Car car : cars) {
    if (car.getPosition() >= track.getFinishPosition()) {
      for (int i = 0; i < cars.length; i++) {
        xPos[i] = cars[i].x;
      }
      for (int i=0; i < xPos.length; i++) {
        if (max < xPos[i]) {
          max = xPos[i];
        }
      }
      //
      for (int i = 0; i < cars.length; i++) {
        if (cars[i].x == max) {
          cars[i].increaseScore();
          raceOver = true;
          println("Car " + cars[i].y + " has won");
        }
      }
    }
  }
}
