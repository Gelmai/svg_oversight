
class Person {
  String firstName = "";
  String lastName = "";
  String notes = "";
  int personId;
  
  int length =0;

  Person(this.firstName, this.lastName, this.personId);

  Person get nextPerson {
    currentPersonIndex++;
    if (currentPersonIndex >= length) return null;
   return masterList[currentPersonIndex];
   }
   
}
int personCounter = 0;
int currentPersonIndex = 0;
List<Person> masterList = [];


void addPerson(firstName, lastName) {
  Person newPerson = new Person(firstName, lastName, personCounter);
  personCounter++;
  masterList.add(newPerson);
  print(newPerson.firstName + " added!");
}