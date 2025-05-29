public class DataItem {
  private String dataName;
  private int value;
  private int color;
  
  public DataItem(String name, int val) {
    dataName = name;
    value = val;
  }
  
  public String getDataName() {
    return dataName;
  }
  
  public int getDataValue() {
    return value;
  }
  
  public void setColor(int c) {
    color = c;
  }
  
  public int getColor() {
    return color;
  }
}
