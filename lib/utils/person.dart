import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'dart:async';

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
   
   Person.fromJson(Map<String, dynamic> p) {
    firstName = p['firstName'];
    lastName = p['lastName'];
    notes = p['notes'];
    personId = p['personId'];
   }

   String get personFirstName => firstName;
   String get personLastName => lastName;
   String get personNotes => notes;
   String get personStoredId => personId.toString();

   Map<String, dynamic> toJson() => {
     'firstName': firstName,
     'lastName': lastName,
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
  print(newPerson.firstName + " added!");
  saveFile();
}

void deletePerson(index) {
  masterList.removeAt(index);
  saveFile();
}

void saveFile() async {
  final String storedPersonKey = 'gelmaiSVGOversight';
  final String storedCounter = 'gelmaiSVGOversightCounter';
  
  SharedPreferences sp = await (SharedPreferences.getInstance());
  sp.setString(storedPersonKey, json.encode(masterList));
  sp.setString(storedCounter, json.encode(globalPersonCounter));
  print(globalPersonCounter);
}

Future loadFile() async {
  final String storedPersonKey = 'gelmaiSVGOversight';
  final String storedCounter = 'gelmaiSVGOversightCounter';

  SharedPreferences sp = await (SharedPreferences.getInstance());
  await json
    .decode(sp.getString(storedPersonKey))
    .forEach((map) => masterList.add(new Person.fromJson(map)));
  
  try {
    globalPersonCounter = await json.decode(sp.getString(storedCounter));
  } catch (e) { 
    print(e);
  }
}

Future<String> listLoaded() async {
   while (masterList == []) {} 
   return '';
}