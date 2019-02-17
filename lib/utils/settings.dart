import 'dart:core';
import 'package:flutter/material.dart';
import '../utils/person.dart';

bool isDarkTheme = false;
String listSort = 'Last Name A-Z';
Brightness brightness = Brightness.light;


void setListSort(String _sort) {
  try {
    switch (_sort) {
    case 'Last Name A-Z': {
      masterList.sort((a, b) {
        a.lastName.toString().toLowerCase().compareTo(b.lastName.toString().toLowerCase());
      });
      break;
    }

    case 'Last Name Z-A': {
      masterList.sort((a, b) {
        a.lastName.toString().toLowerCase().compareTo(b.lastName.toString().toLowerCase());
        masterList.reversed;
      });
      break;
    }

    case 'Shepherding Date A-Z': {
      masterList.sort((a, b) {
        a.lastShepherded.toString().toLowerCase().compareTo(b.lastShepherded.toString().toLowerCase());
      });
      break;
    }

    case 'Shepherding Date Z-A': {
      masterList.sort((a, b) {
        a.lastShepherded.toString().toLowerCase().compareTo(b.lastShepherded.toString().toLowerCase());
        masterList.reversed;
      });
      break;
    }
  }  
  } catch (e) {
    print(_sort);
    print(e);
  }
  
}