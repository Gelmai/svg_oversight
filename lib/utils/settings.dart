import 'dart:core';
import 'package:flutter/material.dart';
import '../utils/person.dart';



class Settings {
  bool isDarkTheme = false;
  String listSort = 'Last Name A-Z';
  Brightness brightness = Brightness.light;
  

  Settings.fromJson(Map<String, dynamic> p) {
    isDarkTheme = p['isDarkTheme'];
    listSort = p['listSort'];
    brightness = p['brightness'];
  }

  Map<String, dynamic> toJson() => {
    'isDarkTheme': isDarkTheme,
    'listSort': listSort,
    'brightness': brightness,
  };
}
List<Settings> currentSettings = [];

void setListSort(String _sort) {
  try {
    switch (_sort) {
    case 'Last Name A-Z': {
      masterList.sort((a, b) {
        a.lastName.toString().toLowerCase().compareTo(b.lastName.toString().toLowerCase());
        print('N A-Z');
      });
      break;
    }

    case 'Last Name Z-A': {
      masterList.sort((a, b) {
        a.lastName.toString().toLowerCase().compareTo(b.lastName.toString().toLowerCase());
        masterList.reversed;
        print('N Z-A');
      });
      break;
    }

    case 'Shepherding Date A-Z': {
      masterList.sort((a, b) {
        a.lastShepherded.toString().toLowerCase().compareTo(b.lastShepherded.toString().toLowerCase());
        print('S A-Z');
      });
      break;
    }

    case 'Shepherding Date Z-A': {
      masterList.sort((a, b) {
        a.lastShepherded.toString().toLowerCase().compareTo(b.lastShepherded.toString().toLowerCase());
        masterList.reversed;
        print('N Z-A');
      });
      break;
    }
  }  
  } catch (e) {
    print(_sort);
    print(e);
  }
  
}