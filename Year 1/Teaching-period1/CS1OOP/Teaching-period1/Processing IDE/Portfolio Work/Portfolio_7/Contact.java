class Contact {
  public String firstName;
  public String lastName;
  public String eAddress;
  public String pNum;

  public Contact(String fName, String lName) {
    this.firstName = fName;
    this.lastName = lName;
  }

  public void setEmail(String eAdd) {
    this.eAddress = eAdd;
  }

  public void setMobile(String p) {
    this.pNum = p;
  }

  public String getfName() {
    return firstName;
  }

  public String getlName() {
    return lastName;
  }

  public String getEmail() {
    return eAddress;
  }

  public String getNum() {
    return pNum;
  }

  public String toStr() {
    return "First Name: " + firstName + "\nLast Name: " + lastName + "\nEmail: " + eAddress + "\nPhone Number: " + pNum;
  }
}
