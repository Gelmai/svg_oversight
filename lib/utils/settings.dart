import 'dart:core';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:service_group/pages/home_page.dart';
import 'package:service_group/utils/storage.dart';
import '../utils/person.dart';

class Settings {
  bool isDarkTheme = false;
  String listSort = 'Last Name A-Z';

  Settings({this.isDarkTheme, this.listSort});

  Settings.fromJson(Map<String, dynamic> p) {
    isDarkTheme = p['isDarkTheme'] == 'false' ? false : true;
    listSort = p['listSort'];
  }

  Map<String, dynamic> toJson() => {
        'isDarkTheme': isDarkTheme.toString(),
        'listSort': listSort,
      };

  void setListSort(String _sort) {
    try {
      switch (_sort) {
        case 'Last Name A-Z':
          {
            masterList.sort((a, b) {
              a.lastName
                  .toString()
                  .toLowerCase()
                  .compareTo(b.lastName.toString().toLowerCase());
              print('N A-Z');
              return;
            });
            break;
          }

        case 'Last Name Z-A':
          {
            masterList.sort((a, b) {
              a.lastName
                  .toString()
                  .toLowerCase()
                  .compareTo(b.lastName.toString().toLowerCase());
              masterList.reversed;
              print('N Z-A');
              return;
            });
            break;
          }

        case 'Shepherding Date A-Z':
          {
            masterList.sort((a, b) {
              a.lastShepherded
                  .toString()
                  .toLowerCase()
                  .compareTo(b.lastShepherded.toString().toLowerCase());
              print('S A-Z');
              return;
            });
            break;
          }

        case 'Shepherding Date Z-A':
          {
            masterList.sort((a, b) {
              a.lastShepherded
                  .toString()
                  .toLowerCase()
                  .compareTo(b.lastShepherded.toString().toLowerCase());
              masterList.reversed;
              print('N Z-A');
              return;
            });
            break;
          }

        default:
          {
            masterList.sort((a, b) {
              a.lastName
                  .toString()
                  .toLowerCase()
                  .compareTo(b.lastName.toString().toLowerCase());
              print('N A-Z');
              return;
            });
            break;
          }
      }
    } catch (e) {
      print(_sort);
      print(e);
    }
  }
}

class ThemeNotifier with ChangeNotifier {
  final darkTheme = ThemeData(
    brightness: Brightness.dark,
    accentColor: Colors.deepPurple,
    toggleableActiveColor: Colors.deepPurple,
  );
  final lightTheme = ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.deepPurple,
  );

  ThemeData _themeData;

  ThemeNotifier() {
    loadSettings();

    if (currentSettings.isDarkTheme == true) {
      _themeData = lightTheme;
    } else {
      _themeData = darkTheme;
    }
    notifyListeners();
  }

  ThemeData getTheme() => _themeData;

  void setDarkTheme() async {
    _themeData = darkTheme;
    currentSettings.isDarkTheme = true;
    saveSettings();
    notifyListeners();
  }

  void setLightTheme() async {
    _themeData = lightTheme;
    currentSettings.isDarkTheme = false;
    saveSettings();
    notifyListeners();
  }
}