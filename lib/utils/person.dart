import 'package:flutter/material.dart';
import '../pages/add_person.dart';
import '../pages/home_page.dart';

class Person {
  String firstName = "";
  String lastName = "";
  int personId;
  int length =0;

  Person(this.firstName, this.lastName, this.personId);

  Person get nextPerson {
    currentPersonIndex++;
    if (currentPersonIndex >= length) return null;
   return masterList[currentPersonIndex];
   }
   
}

int currentPersonIndex = 0;
List<Person> masterList = [];


void addPerson(firstName, lastName) {
  Person newPerson = new Person(firstName, lastName, currentPersonIndex);
  currentPersonIndex++;
  masterList.add(newPerson);
  print(newPerson.firstName + "added!");
}


