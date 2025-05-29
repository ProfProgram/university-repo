import java.util.Scanner;
import java.util.List;

public String fileName;
public PhoneList allPhones;
public Scanner in;
public PhoneMap map;

void setup() {
  fileName = sketchPath() + "/phoneData.csv";
  allPhones = new PhoneList();
  in = InputReader.getScanner(fileName);
  map = new PhoneMap();
  readData();
  allPhones.sort();
  println(allPhones.toString());

  /*
  this phone exists
  */
  Phone iPhone7Plus = allPhones.search4phone("Apple", "iPhone 7 Plus");
  println("\niPhone 7 Plus stats are:");
  println(iPhone7Plus);

  /*
  fake phone null test
  */
  Phone fake = allPhones.search4phone("fake", "fake");
  println("\nfake stats are:");
  println(fake);

  // prints phoneList of phones higher than 600 euros
  PhoneList higher_600 = allPhones.phones_at_price(600);
  higher_600.sort();
  println("\nPhones higher than 600 euros:");
  println(higher_600.toString());
  
  // printing PhoneMap map
  println(map.toString());

  // using PhoneMap to search
  Phone foundPhone = map.search("Samsung", "Galaxy S7 (USA)");
  println("\nFoundPhone: " + foundPhone);
  
  println();
}

void readData() {
  String header = in.nextLine();
  System.out.println(header);

  List<Phone> phoneList = new ArrayList<>();

  while (in.hasNext()) {
    String csv = in.nextLine();
    String[] data = csv.split(",");
    Phone p = new Phone(data[0]);
    p.setModel(data[1]);
    p.setAnnounced(data[8]);
    float w = Float.parseFloat(data[11]);
    p.setWeight_g(w);
    p.setInternal_memory(data[21]);
    int price = Integer.parseInt(data[36]);
    p.setApprox_price_EUR(price);

    phoneList.add(p);
  }

  for (Phone p : phoneList) {
    allPhones.addPhone(p);
    map.addPhone(p);
  }

  println("-------------------------------------");
  println("Total number of phones is " + allPhones.getNOP());
  //println(phoneList.size());
}
