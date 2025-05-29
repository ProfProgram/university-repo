public class Contact {
  private String name;
  private String phoneNumber;
  // email addresses are unique so use this as the key
  private String email;
  
  public Contact(String name, String email, String phone) {
    this.name = name;
    this.email = email;
    this.phoneNumber = phone;
  }
  
  public String getName() {
    return name;
  }
  
  public String getEmail() {
    return email;
  }
  
  public String getPhoneNumber() {
    return phoneNumber;
  }
  
  public String toString() {
    return "Contact name: " + name + " email: " + email + " phone number " + phoneNumber;
  }
}
