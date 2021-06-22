import 'dart:core';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
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
    notifyListeners();
  }

  void setLightTheme() async {
    _themeData = lightTheme;
    isDarkTheme = false;
    notifyListeners();
  }

  void saveSettings(Settings settings) {
    //final file = await _localSettingsFile;
    //file.writeAsString(json.encode(currentSettings));
    var settingsBox = Hive.box('settings');

    settingsBox.put('isDarkTheme', settings.isDarkTheme);
    settingsBox.put('listSort', settings.listSort);
    notifyListeners();
  }
}
