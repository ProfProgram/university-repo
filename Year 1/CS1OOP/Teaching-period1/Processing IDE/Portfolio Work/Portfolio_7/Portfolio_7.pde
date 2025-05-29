import java.util.ArrayList;
import java.util.Scanner;

ArrayList<Contact> contacts;
String filename;
Scanner in;

Button prev;
Button next;

int contactIndex;

void readContacts() {
  while (in.hasNext()) {
    String csv = in.nextLine();
    String[] data = csv.split(",");
    Contact contact = new Contact(data[0], data[1]);
    contact.setEmail(data[2]);
    contact.setMobile(data[3]);
    contacts.add(contact);
  }
  int numCont = contacts.size();
  println("You have " + numCont + " contacts: \n");
}

void setup() {
  size(400, 600);
  contacts = new ArrayList<Contact>();
  filename = sketchPath() + "\\Contacts.csv";
  in = InputReader.getScanner(filename);
  readContacts();

  prev = new Button(100, 300, 100, 75);
  prev.setLabel("Prev");

  next = new Button(250, 300, 100, 75);
  next.setLabel("Next");

  contactIndex = 1;
}

void draw() {
  background(255);
  Contact contact = new Contact(contacts.get(contactIndex).getfName(), contacts.get(contactIndex).getlName());
  contact.setEmail(contacts.get(contactIndex).getEmail());
  contact.setMobile(contacts.get(contactIndex).getNum());
  textSize(20);
  fill(0);
  textAlign(LEFT);
  text(contact.toStr(), 100, 200);
  prev.display();
  next.display();
}

void mousePressed() {
  if (next.isInside(mouseX, mouseY) && contactIndex < contacts.size() - 1) {
    contactIndex++;
  }
  if (prev.isInside(mouseX, mouseY) && contactIndex > 1) {
    contactIndex--;
  }
}
