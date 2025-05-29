import java.util.HashMap;

public class PhoneMap {

  private HashMap<String, Phone> phones;

  public PhoneMap() {
    phones = new HashMap<String, Phone>();
  }

  public void addPhone(Phone phone) {
    String k = phone.getBrand() + "-" + phone.getModel();
    phones.put(k, phone);
    
    /*
    whenever i use the below code to run addPhone it doesnt add all phones
    using map.getNOP() to check it only gets 24 out of 143 phones
    */
    //String brand = phone.getBrand();
    //phones.put(brand, phone);
  }

  public int getNOP() {
    return phones.size();
  }

  public String toString() {
    String result = "";
    for (Phone phone : phones.values() ) {
      result += "\n"+ phone.toString();
    }
    return result;
  }

  public Phone search(String brand, String model) {
    return phones.values().stream()
      .filter(p -> p.getBrand().equals(brand) && p.getModel().equals(model))
      .findFirst()
      .orElse(null);
  }
  /*
  phones.values() returns an array with all all the values of HashMap phones
  similar to phones.ketSet(), but for values instead.
  Unlike keySet(), values cannnot be printed as it is an array of obj
  */
}
