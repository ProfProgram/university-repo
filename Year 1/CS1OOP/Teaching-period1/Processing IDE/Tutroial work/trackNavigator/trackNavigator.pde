import java.util.Scanner;
import java.util.ArrayList;

ArrayList<Track> tracks;
String filename;
Scanner in;

Button prev;
Button next;

public int trackIndex;

void readAllTracks() {
  while (in.hasNext()) {
    String csv = in.nextLine();
    String[] data = csv.split(",");
    Track track = new Track(data[0], data[1], data[2]);
    tracks.add(track);
  }
  int numTitles = tracks.size();
  println("You read " + numTitles + " tracks: \n");
}

void setup() {
  size(400, 600);
  tracks = new ArrayList<Track>();
  filename = sketchPath() + "\\DailyMix.csv";
  in = InputReader.getScanner(filename);
  readAllTracks();

  prev = new Button(100, 300, 100, 75, "Prev");
  next = new Button(250, 300, 100, 75, "Next");

  trackIndex = 1;
}

void draw() {
  background(255);
  Track track = new Track(tracks.get(trackIndex).getTitle(), tracks.get(trackIndex).getArtist(), tracks.get(trackIndex).getLength());
  
  textSize(20);
  fill(0);
  textAlign(LEFT);
  text(track.toStr(), 100, 200);
  prev.display();
  next.display();
}

void mousePressed() {
  if (next.isInside(mouseX, mouseY) && trackIndex < tracks.size() - 1) {
    trackIndex++;
    
  }
  if (prev.isInside(mouseX, mouseY) && trackIndex > 1) {
    trackIndex--;
  }
}
