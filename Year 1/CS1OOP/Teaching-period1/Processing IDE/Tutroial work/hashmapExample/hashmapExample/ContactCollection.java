import java.util.HashMap;

public class ContactCollection {
  
  private HashMap<String, Contact> contacts;
  
  public ContactCollection() {
    contacts = new HashMap<String, Contact>();
  }
  
  public void addContact(Contact contact) {
    String email = contact.getEmail();
    contacts.put(email, contact);
  }
  
    public void addContactByName(Contact contact) {
    String name = contact.getName();
    contacts.put(name, contact);
  }
  
  public Contact getContact(String theKey) {
    return contacts.get(theKey);
  }

}
