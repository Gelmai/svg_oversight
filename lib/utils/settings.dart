import 'dart:core';
import 'package:flutter/material.dart';
import '../utils/person.dart';

//String listSort;


ThemeData setDarkTheme(ThemeData themeData, bool _selection) {
  if (_selection == true) {
    themeData = ThemeData(
    brightness: Brightness.dark
    );
    return themeData;
  } else {
    themeData = ThemeData(
      brightness: Brightness.light
    );
    return themeData;
  }
}

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

void setTheme() {
  
}