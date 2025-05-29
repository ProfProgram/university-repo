import java.util.Scanner;

private String fileName;
private MovieList allMovieData;
private Scanner in;

void setup() {
  fileName = sketchPath() + "/bfi-weekend-box-office-report-2023-10-27-29.csv";
  allMovieData = new MovieList();
  in = InputReader.getScanner(fileName);
  readData();
  allMovieData.sort();
  println(allMovieData.toString());
  
  // SEARCHING
  /*
  this movie does exist
  */
  MovieData leo = allMovieData.findByName("Leo");
  println("\nThe movie called Leo is:");
  println(leo);
  
  /*
  this movie doesnt exist
  */
  //MovieData leo = allMovieData.findByName("leo");
  //println("\nThe movie called leo is:");
  //println(leo);
  
  /*
  this ditributor does not exist
  */
  MovieList universalMovies = allMovieData.findByDistributor("Universal");
  println("\nUniversal movies are:");
  println(universalMovies.toString());
}

void readData() {
  String header = in.nextLine();
  System.out.println(header);

  while (in.hasNext()) {
    String csv = in.nextLine();
    String[] data = csv.split(";");
    MovieData movie = new MovieData(data[0]);
    movie.setCountryOfOrigin(data[1]);
    int weekendGross = Integer.parseInt(data[2]);
    movie.setWeekendGross(weekendGross);
    movie.setDistributor(data[3]);
    if (data[4].equals("-")) {
      data[4] = "0";
    } else {
      double pcChange = Double.parseDouble(data[4]);
      movie.setPcChangeOnLastWeek(pcChange);
    }
    int WOR = Integer.parseInt(data[5]);
    movie.setWeeksOnRelease(WOR);
    int NOC = Integer.parseInt(data[6]);
    movie.setNumberOfCinemas(NOC);
    int SA = Integer.parseInt(data[7]);
    movie.setSiteAverage(SA);
    int TGTD = Integer.parseInt(data[8]);
    movie.setTotalGrossToDate(TGTD);
    allMovieData.addMovieData(movie);
  }
  println("-------------------------------------");
  println("Total number of movies is " + allMovieData.getNumberOfMovies());
}
