import 'dart:core';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:service_group/pages/home_page.dart';
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

  Stream<String> listOrder() async* {
    var listOrder = Hive.box('settings');
    yield listOrder.get('listSort');
  }

  void setListSort(String _sort) {
    try {
      switch (_sort) {
        case 'Last Name A-Z':
          {
            masterList.sort((a, b) => a.lastName.compareTo(b.lastName));
            listOrder();
            print('N A-Z');
            break;
          }

        case 'Last Name Z-A':
          {
            masterList.sort((a, b) => b.lastName.compareTo(a.lastName));
            print('N Z-A');
            listOrder();
            break;
          }

        case 'Shepherding Date A-Z':
          {
            masterList
                .sort((a, b) => a.lastShepherded.compareTo(b.lastShepherded));
            listOrder();
            break;
          }

        case 'Shepherding Date Z-A':
          {
            masterList
                .sort((a, b) => b.lastShepherded.compareTo(a.lastShepherded));
            listOrder();
            break;
          }

        default:
          {
            listOrder();
            return;
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
    primarySwatch: Colors.deepPurple,
    primaryColor: Colors.deepPurple,
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

  void loadTheme() async {}
}
