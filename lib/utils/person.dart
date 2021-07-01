import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
part 'person.g.dart';

@HiveType(typeId: 1)
class Person extends HiveObject with ChangeNotifier {
  @HiveField(0)
  String firstName = "";
  @HiveField(1)
  String lastName = "";
  @HiveField(2)
  String lastShepherded = "";
  @HiveField(3)
  String notes = "";

  Person([this.firstName, this.lastName, this.lastShepherded, this.notes]);

  Person.fromJson(Map<String, dynamic> p) {
    firstName = p['firstName'];
    lastName = p['lastName'];
    lastShepherded = p['lastShepherded'];
    notes = p['notes'];
  }

  String get personFirstName => firstName;
  String get personLastName => lastName;
  String get personLastShepherded => lastShepherded.toString();
  String get personNotes => notes;

  Map<String, dynamic> toJson() => {
        'firstName': firstName,
        'lastName': lastName,
        'lastShepherded': lastShepherded,
        'notes': notes,
      };

  void addPerson(firstName, lastName) {
    final date = DateTime.now().toString();
    final persons = Hive.box('persons');
    Person newPerson = new Person(firstName, lastName, date);
    persons.add(newPerson);
    //masterList.add(newPerson);
    //used to sort at this location
    print(newPerson.firstName + " added!");
  }

  void deletePerson(index) {
    //masterList.removeAt(index);
    //used to sort at this location
    final persons = Hive.box('persons');
    persons.deleteAt(index);
  }
}
