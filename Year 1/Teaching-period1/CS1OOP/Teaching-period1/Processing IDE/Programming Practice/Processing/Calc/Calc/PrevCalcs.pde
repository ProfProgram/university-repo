import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.BufferedReader;
import java.io.FileReader;

void writePrevCalcs() {
  try {
    BufferedWriter w = new BufferedWriter(new FileWriter(sketchPath() + "PrevCalculations.txt"));

    for (String s : prevCals) {
      w.write(s);
    }
    w.close();
  }
  catch (IOException e) {
    e.printStackTrace();
  }
}

void readPrevCalcs() {
  try {
    BufferedReader r = new BufferedReader(new FileReader(sketchPath() + "PrevCalculations.txt"));
    String text;
    while ((text = r.readLine()) != null) {
      line.add(text);
      println(text);
    }
    r.close();
  }
  catch (IOException e) {
    e.printStackTrace();
  }
}
