class Score {

  //SCORE
  int score;  //score counter
  int max_score;

  Score() {
    //SCORE
    score = 0;
    max_score = 10;
  }

  void display() {
    //SCORE COUNTER
    textSize(20);
    textAlign(LEFT);
    fill(0);
    text("SCORE:", m.map_x + (m.mapSizeX/2) + 10, m.map_y - (m.mapSizeY/2) + 20);
    textSize(50);
    text(str(score), m.map_x + (m.mapSizeX/2) + 25, m.map_y - (m.mapSizeY/2) + 70);
  }

  void maxScore() {
    //IF SCORE = MAX_SCORE
    if (score == max_score)
    {
      textSize(20);
      textAlign(LEFT);
      fill(0);
      text("WINNER", m.map_x + (m.mapSizeX/2) + 10, m.map_y - (m.mapSizeY/2) + 100);
      pl.player_colour = color(int(random(256)), int(random(256)), int(random(256)));
    }
  }
  void gameOver() {
    background(0);
    drawText(50, color(255), CENTER, "GAME OVER", width/2, height/2);
    pl.gone();
  }
}
