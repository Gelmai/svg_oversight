import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:service_group/pages/home_page.dart';
import 'dart:convert';
import 'dart:async';
import 'person.dart';
import './settings.dart';

void savePersons() async {
  final file = await _localPersonsFile;
  file.writeAsString(json.encode(masterList));
}

void saveSettings() async {
  final file = await _localSettingsFile;
  file.writeAsString(json.encode(currentSettings));
  print(file);
}

Future<String> loadPersons() async {
  try {
    final file = await _localPersonsFile;
    final contents = await file.readAsString();
    await json
        .decode(contents)
        .forEach((map) => masterList.add(new Person.fromJson(map)));
    listLoaded();
    return '';
  } catch (e) {
    print(e);
    return '';
  }
}

Future<String> loadSettings() async {
  //return '';
  //print('Loading settings is disabled');

  try {
    final file = await _localSettingsFile;
    final contents = await file.readAsString();
    await json.decode(contents).forEach((map) => Settings.fromJson(map));
    listLoaded();
    return '';
  } catch (e) {
    print(e);
    print('Loading settings failed');
    return '';
  }
}

Future<String> listLoaded() async {
  return '';
}

Future<File> get _localPersonsFile async {
  final path = await _localPath;
  return File('$path/persons.txt');
}

Future<File> get _localSettingsFile async {
  final path = await _localPath;
  return File('$path/settings.txt');
}

Future<String> get _localPath async {
  final directory = await getApplicationDocumentsDirectory();
  return directory.path;
}
