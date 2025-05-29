ContactCollection contacts;

void setup() {
  contacts = new ContactCollection();
  // create some contacts
  Contact bob = new Contact("Bob Cratchett", "bob@scrooge_and_marley.com", "123 4567");
  Contact scrooge = new Contact("Ebenezer Scrooge", "scrooge@scrooge_and_marley.com", "444 9876");
  Contact marley = new Contact("Jacob Marley", "marley@scrooge_and_marley.com", "987 6543");
  // Add these contacts to the collection
  // store bob with his email address as the key
  contacts.addContact(bob);
  // store bob with his name as the key
  contacts.addContactByName(bob);
  // store scrooge with his email address as the key
  contacts.addContact(scrooge);
  // store marley with his email address as the key
  contacts.addContact(marley);
}

public void draw() {
  // get Bob using his email as the key
  println("Bob: ", contacts.getContact("bob@scrooge_and_marley.com"));
  // get Scrooge using his email as the key
  println("Scrooge: ", contacts.getContact("scrooge@scrooge_and_marley.com"));
  // get Bob using his name as the key
  println("Bob (name as key):", contacts.getContact("Bob Cratchett"));
  // try to find someone using an unknown key (we should get back null)
  println("An unknown key:", contacts.getContact("Jacob Marley"));
  noLoop();
}
