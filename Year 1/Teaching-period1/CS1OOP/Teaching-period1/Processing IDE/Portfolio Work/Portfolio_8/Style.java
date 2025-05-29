class Style {
  
  private int fillColor;
  private int strokeColor;
  private int bgColor;
  private int textSize;
  private String name;
  
  public Style(String label, int bgCol, int stroke, int fill, int tSize) {
    this.fillColor = fill;
    this.strokeColor = stroke;
    this.bgColor = bgCol;
    this.textSize = tSize;
    this.name = label;
  }
  
  public String getName() {
    return name;
  }
  
  public int getFillColor() {
    return fillColor;
  }
  
  public int getStrokeColor() {
    return strokeColor;
  }
  
  public int getTextSize() {
    return textSize;
  }
  
  public int getBackground() {
    return bgColor;
  }
}
