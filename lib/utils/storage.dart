import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'dart:convert';
import 'dart:async';
import 'person.dart';

void saveFile() async {
  // final String storedPersonKey = 'gelmaiSVGOversight';
  // final String storedCounter = 'gelmaiSVGOversightCounter';
  
  // SharedPreferences sp = await (SharedPreferences.getInstance());
  // sp.setString(storedPersonKey, json.encode(masterList));
  // sp.setString(storedCounter, json.encode(globalPersonCounter));
  // print(globalPersonCounter);
  final file = await _localFile;
  file.writeAsString(json.encode(masterList));
}

Future<String> loadFile() async {
  // final String storedPersonKey = 'gelmaiSVGOversight';
  // final String storedCounter = 'gelmaiSVGOversightCounter';

  try {
    // SharedPreferences sp = await (SharedPreferences.getInstance());
    // await json
    //   .decode(sp.getString(storedPersonKey))
    //   .forEach((map) => masterList.add(new Person.fromJson(map)));
  
    // globalPersonCounter = await json.decode(sp.getString(storedCounter));
    final file = await _localFile;
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

Future<String> listLoaded() async {
   return '';
}

Future<String> get _localPath async {
  final directory = await getApplicationDocumentsDirectory();
  return directory.path;
}

Future<File> get _localFile async {
  final path = await _localPath;
  return File('$path/persons.txt');
}