import java.util.Scanner;

ArrayList<DataItem> items;
String filename;
Scanner in;

void readList() {
  while (in.hasNext()) {
    String line = in.nextLine();
    String[] parts = line.split(",");
    String name = parts[0];
    int value= Integer.parseInt(parts[1]);
    DataItem item = new DataItem(name, value);
    item.setColor(getRandomColour());
    items.add(item);
  }
}

void setup() {
  size(400, 400);
  items = new ArrayList<DataItem>();
  filename = sketchPath() + "\\shoppingList.csv";
  in = InputReader.getScanner(filename);
  readList();
}

void draw() {
  background(255);
  for (int index = 0; index < items.size(); index++) {
    DataItem item = items.get(index);
    fill(item.getColor());
    float barLength = width * item.getDataValue()/100;
    rect(0, index*30, barLength, 20);
    textSize(20);
    fill(0);
    String label = item.getDataName() + " " + item.getDataValue() + "%";
    text(label, barLength+20, (index*30)+20);
  }
  noLoop(); // no need to keep drawing as there is no animation
}


color getRandomColour() {
  float red = random(0, 255);
  float green = random(0, 255);
  float blue = random(0, 255);
  return color(red, green, blue);
}
