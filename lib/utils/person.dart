import 'package:service_group/utils/storage.dart';

class Person {
  String firstName = "";
  String lastName = "";
  String lastShepherded = "";
  String notes = "";
  int personId;

  int length = 0;

  Person(this.firstName, this.lastName, this.personId, this.lastShepherded,
      [this.notes]);

  Person get nextPerson {
    if (currentPersonIndex < length) currentPersonIndex++;
    return masterList[currentPersonIndex];
  }

  Person.fromJson(Map<String, dynamic> p) {
    firstName = p['firstName'];
    lastName = p['lastName'];
    lastShepherded = p['lastShepherded'];
    notes = p['notes'];
    personId = p['personId'];
  }

  //  String get personFirstName => firstName;
  //  String get personLastName => lastName;
  //  String get personLastShepherded => lastShepherded.toString();
  //  String get personNotes => notes;
  //  String get personStoredId => personId.toString();

  Map<String, dynamic> toJson() => {
        'firstName': firstName,
        'lastName': lastName,
        'lastShepherded': lastShepherded,
        'notes': notes,
        'personId': personId,
      };
}

int globalPersonCounter = 0;
int personCounter = 0;
int currentPersonIndex = 0;
List<Person> masterList = [];

void addPerson(firstName, lastName) {
  final date = DateTime.now().toString();
  Person newPerson = new Person(firstName, lastName, personCounter, date);
  personCounter++;
  globalPersonCounter++;
  newPerson.personId = globalPersonCounter;
  masterList.add(newPerson);
  //used to sort at this location
  print(newPerson.firstName + " added!");
  savePersons();
}

void deletePerson(index) {
  masterList.removeAt(index);
  //used to sort at this location
  //savePersons();
}
