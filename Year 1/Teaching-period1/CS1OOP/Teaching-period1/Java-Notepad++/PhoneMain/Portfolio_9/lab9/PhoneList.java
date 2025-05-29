import java.util.ArrayList;
import java.util.Collections;

public class PhoneList {

  private ArrayList<Phone> phones;
  
  public PhoneList() {
    phones = new ArrayList<Phone>();
  }

  public void addPhone(Phone p) {
    phones.add(p);
  }

  public int getNOP() {
    return phones.size();
  }

  public String toString() {
    String result = "";
    for (int index = 0; index < phones.size(); index++) {
      Phone p = phones.get(index);
      result = result + p.toString();
      result = result + "\n";
    }
    return result;
  }

  // SORTING
  public void sort() {
    Collections.sort(phones);
  }

  public Phone search4phone(String brand, String model) {
    for (int index = 0; index < phones.size(); index++) {
      Phone thisPhone = phones.get(index);
      if (thisPhone.getBrand().equals(brand) && thisPhone.getModel().equals(model)) {
        return thisPhone;
      }
    }
    return null;
  }
  
  public PhoneList phones_at_price(int price) {
    PhoneList list = new PhoneList();
    for (int index = 0; index < phones.size(); index++) {
      Phone thisPhone = phones.get(index);
      if (price > thisPhone.getApprox_price_EUR()) {
        list.addPhone(thisPhone);
      }
    }
    return list;
  }
}
