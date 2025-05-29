public class MovieData implements Comparable<MovieData> {
  
  // SORTING IMPORTANT
  public int compareTo(MovieData otherMovie) {
    int result = otherMovie.totalGrossToDate - totalGrossToDate;
    return result;
  }

  private String name;
  private String countryOfOrigin;
  private int weekendGross;
  private String distributor;
  private double pcChangeOnLastWeek;
  private int weeksOnRelease;
  private int numberOfCinemas;
  private int siteAverage;
  private int totalGrossToDate;

  public MovieData(String name) {
    this.name = name;
  }

  /**
   * @return the name
   */
  public String getName() {
    return name;
  }

  /**
   * @return the countryOfOrigin
   */
  public String getCountryOfOrigin() {
    return countryOfOrigin;
  }

  /**
   * @param countryOfOrigin the countryOfOrigin to set
   */
  public void setCountryOfOrigin(String countryOfOrigin) {
    this.countryOfOrigin = countryOfOrigin;
  }

  /**
   * @return the weekendGross
   */
  public int getWeekendGross() {
    return weekendGross;
  }

  /**
   * @param weekendGross the weekendGross to set
   */
  public void setWeekendGross(int weekendGross) {
    this.weekendGross = weekendGross;
  }

  /**
   * @return the distributor
   */
  public String getDistributor() {
    return distributor;
  }

  /**
   * @param distributor the distributor to set
   */
  public void setDistributor(String distributor) {
    this.distributor = distributor;
  }

  /**
   * @return the pcChangeOnLastWeek
   */
  public double getPcChangeOnLastWeek() {
    return pcChangeOnLastWeek;
  }

  /**
   * @param pcChangeOnLastWeek the pcChangeOnLastWeek to set
   */
  public void setPcChangeOnLastWeek(double pcChangeOnLastWeek) {
    this.pcChangeOnLastWeek = pcChangeOnLastWeek;
  }

  /**
   * @return the weeksOnRelease
   */
  public int getWeeksOnRelease() {
    return weeksOnRelease;
  }

  /**
   * @param weeksOnRelease the weeksOnRelease to set
   */
  public void setWeeksOnRelease(int weeksOnRelease) {
    this.weeksOnRelease = weeksOnRelease;
  }

  /**
   * @return the numberOfCinemas
   */
  public int getNumberOfCinemas() {
    return numberOfCinemas;
  }

  /**
   * @param numberOfCinemas the numberOfCinemas to set
   */
  public void setNumberOfCinemas(int numberOfCinemas) {
    this.numberOfCinemas = numberOfCinemas;
  }

  /**
   * @return the siteAverage
   */
  public int getSiteAverage() {
    return siteAverage;
  }

  /**
   * @param siteAverage the siteAverage to set
   */
  public void setSiteAverage(int siteAverage) {
    this.siteAverage = siteAverage;
  }

  /**
   * @return the totalGrossToDate
   */
  public int getTotalGrossToDate() {
    return totalGrossToDate;
  }

  /**
   * @param totalGrossToDate the totalGrossToDate to set
   */
  public void setTotalGrossToDate(int totalGrossToDate) {
    this.totalGrossToDate = totalGrossToDate;
  }

  @Override
    public String toString() {
    return name +
      ", " + countryOfOrigin +
      ", £" + weekendGross +
      ", " + distributor +
      ", " + pcChangeOnLastWeek+
      "%, " + weeksOnRelease +
      ", " + numberOfCinemas +
      ", " + siteAverage +
      ", £" + totalGrossToDate;
  }
}
