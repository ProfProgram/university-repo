import java.util.ArrayList;
import java.util.Collections;

public class MovieList {

  private ArrayList<MovieData> movies;

  public MovieList() {
    movies = new ArrayList<MovieData>();
  }

  public void addMovieData(MovieData movie) {
    movies.add(movie);
  }

  public int getNumberOfMovies() {
    return movies.size();
  }

  public String toString() {
    String result = "";
    for (int index = 0; index < movies.size(); index++) {
      MovieData movie = movies.get(index);
      result = result + movie.toString();
      result = result + "\n";
    }
    return result;
  }
  
  // SORTING
  public void sort() {
    Collections.sort(movies);
  }

  public MovieData findByName(String name) {
    for (int index = 0; index < movies.size(); index++) {
      MovieData thisMovie = movies.get(index);
      if (thisMovie.getName().equals(name)) {
        return thisMovie;
      }
    }
    return null;
  }

  public MovieList findByDistributor(String d) {
    MovieList list = new MovieList();
    for (int index = 0; index < movies.size(); index++) {
      MovieData thisMovie = movies.get(index);
      if (thisMovie.getDistributor().equals(d)) {
        list.addMovieData(thisMovie);
      }
    }
    return list;
  }
}
