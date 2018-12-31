import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'dart:async';

class Person {
  String firstName = "";
  String lastName = "";
  String lastShepherded = "";
  String notes = "";
  int personId;
  
  int length =0;

  Person(this.firstName, this.lastName, this.personId, [this.lastShepherded, this.notes]);

  Person get nextPerson {
    currentPersonIndex++;
    if (currentPersonIndex >= length) return null;
   return masterList[currentPersonIndex];
   }
   
   Person.fromJson(Map<String, dynamic> p) {
    firstName = p['firstName'];
    lastName = p['lastName'];
    lastShepherded = p['lastShepherded'];
    notes = p['notes'];
    personId = p['personId'];
   }

   String get personFirstName => firstName;
   String get personLastName => lastName;
   String get personLastShepherded => lastShepherded.toString();
   String get personNotes => notes;
   String get personStoredId => personId.toString();

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
  Person newPerson = new Person(firstName, lastName, personCounter);
  personCounter++;
  globalPersonCounter++;
  newPerson.personId = globalPersonCounter;
  masterList.add(newPerson);
  masterList.sort((a, b) {
    return a.personLastName.toString().toLowerCase().compareTo(b.personLastName.toString().toLowerCase());
  });
  print(newPerson.firstName + " added!");
  saveFile();
}

void deletePerson(index) {
  masterList.removeAt(index);
  masterList.sort((a, b) {
    return a.personLastName.toString().toLowerCase().compareTo(b.personLastName.toString().toLowerCase());
  });
  saveFile();
}

void saveFile() async {
  // final String storedPersonKey = 'gelmaiSVGOversight';
  // final String storedCounter = 'gelmaiSVGOversightCounter';
  
  // SharedPreferences sp = await (SharedPreferences.getInstance());
  // sp.setString(storedPersonKey, json.encode(masterList));
  // sp.setString(storedCounter, json.encode(globalPersonCounter));
  // print(globalPersonCounter);
  final file = await _localFile;
  file.writeAsString(json.encode(masterList));
}

Future loadFile() async {
  // final String storedPersonKey = 'gelmaiSVGOversight';
  // final String storedCounter = 'gelmaiSVGOversightCounter';

  try {
    // SharedPreferences sp = await (SharedPreferences.getInstance());
    // await json
    //   .decode(sp.getString(storedPersonKey))
    //   .forEach((map) => masterList.add(new Person.fromJson(map)));
  
    // globalPersonCounter = await json.decode(sp.getString(storedCounter));
    final file = await _localFile;
    final contents = await file.readAsString();
    await json
      .decode(contents)
      .forEach((map) => masterList.add(new Person.fromJson(map)));
  } catch (e) { 
    print(e);
  }
}

Future<String> listLoaded() async {
   while (masterList == []) {} 
   return '';
}

Future<String> get _localPath async {
  final directory = await getApplicationDocumentsDirectory();
  return directory.path;
}

Future<File> get _localFile async {
  final path = await _localPath;
  return File('$path/persons.txt');
}