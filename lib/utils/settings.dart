import 'dart:core';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:service_group/utils/storage.dart';
import '../utils/person.dart';
part 'settings.g.dart';

@HiveType(typeId: 0)
class Settings extends HiveObject with ChangeNotifier {
  Settings({this.isDarkTheme, this.listSort});

  @HiveField(0)
  bool isDarkTheme = false;

  @HiveField(1)
  String listSort = 'Last Name A-Z';

  bool get darkThemeGet => isDarkTheme;
  String get listSortGet => listSort;
  /*
  Settings.fromJson(Map<String, dynamic> json) {
    isDarkTheme = json['isDarkTheme'];
    listSort = json['listSort'];
  }
*/
  Map<dynamic, dynamic> toJson() => {
        'isDarkTheme': isDarkTheme,
        'listSort': listSort,
      };

  void setListSort(String _sort) {
    try {
      switch (_sort) {
        case 'Last Name A-Z':
          {
            masterList.sort((a, b) => a.lastName.compareTo(b.lastName));
            notifyListeners();
            print('N A-Z');
            break;
          }

        case 'Last Name Z-A':
          {
            masterList.sort((a, b) => b.lastName.compareTo(a.lastName));
            print('N Z-A');
            notifyListeners();
            break;
          }

        case 'Shepherding Date A-Z':
          {
            masterList
                .sort((a, b) => a.lastShepherded.compareTo(b.lastShepherded));
            notifyListeners();
            break;
          }

        case 'Shepherding Date Z-A':
          {
            masterList
                .sort((a, b) => b.lastShepherded.compareTo(a.lastShepherded));
            notifyListeners();
            break;
          }

        default:
          {
            masterList.sort((a, b) => a.lastName.compareTo(b.lastName));
            notifyListeners();
            return;
          }
      }
    } catch (e) {
      print(_sort);
      print(e);
    }
  }

  final darkTheme = ThemeData(
    brightness: Brightness.dark,
    primarySwatch: Colors.deepPurple,
    toggleableActiveColor: Colors.deepPurple,
  );
  final lightTheme = ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.deepPurple,
  );

  ThemeData _themeData;

  ThemeData getTheme() {
    if (isDarkTheme == true) {
      _themeData = darkTheme;
    } else {
      _themeData = lightTheme;
    }
    return _themeData;
  }

  void setDarkTheme() async {
    _themeData = darkTheme;
    isDarkTheme = true;
    saveSettings();
    notifyListeners();
  }

  void setLightTheme() async {
    _themeData = lightTheme;
    isDarkTheme = false;
    saveSettings();
    notifyListeners();
  }
}
