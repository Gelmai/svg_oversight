/*
import 'dart:io';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:service_group/utils/settings.dart';
import 'dart:convert';
import 'dart:async';

//void savePersons() async {
//  final file = await _localPersonsFile;
//  file.writeAsString(json.encode(masterList));
//}

Future<String> loadPersons() async {
  //try {
  //  final file = await _localPersonsFile;
  //  final contents = await file.readAsString();
  //  await json
  //      .decode(contents)
  //      .forEach((map) => masterList.add(new Person.fromJson(map)));
  //
  //  return '';
  //} catch (e) {
  //  print(e);
  //  return '';
  //}
  return '';
}

Future<String> listLoaded() async {
  return '';
}

Future<File> get _localPersonsFile async {
  final path = await _localPath;
  return File('$path/persons.txt');
}
/*
Future<File> get _localSettingsFile async {
  final path = await _localPath;

  return File('$path/settings.txt');
}
*/

Future<String> get _localPath async {
  final directory = await getTemporaryDirectory();
  return directory.path;
}
*/
