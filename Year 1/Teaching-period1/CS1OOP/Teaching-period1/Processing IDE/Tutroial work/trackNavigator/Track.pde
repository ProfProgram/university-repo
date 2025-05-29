class Track {
  private String title;
  private String artist;
  private String len;
  
  public Track(String title, String artist, String len) {
    this.title = title;
    this.artist = artist;
    this.len = len;
  }
  
  public String toStr() {
    return title + "\nBy: " + artist + "\nLength: " + len + "\n";
  }
  
  public String getTitle() {
    return title;
  }
  
  public String getArtist() {
    return artist;
  }
  
  public String getLength() {
    return len;
  }
}
