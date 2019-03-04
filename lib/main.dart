import 'package:flutter/material.dart';
import './pages/home_page.dart';
import './pages/add_person.dart';
import './pages/person_detail.dart';
import './pages/settings_page.dart';
import './utils/settings.dart';
import './utils/storage.dart';

void main() async {
  loadPersons().then((String value) {
  runApp(MyApp());
  });
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();

  MyApp();
}

class _MyAppState extends State<MyApp> {
  

  @override
  void initState() {
    try {
      loadSettings();  
    } catch (e) {
      print(e);
    }
    
    super.initState();
  }
  
  setLightTheme() {
    setState(() {
      if (currentSettings.isDarkTheme == true) {
        currentSettings.brightness = Brightness.dark;
        } else {
          currentSettings.brightness = Brightness.light;
      }
    });
  }

  setTheme() {
    setState(() {});
  }
  
  @override
  Widget build(BuildContext context) {
    setLightTheme();
    setListSort(currentSettings.listSort);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: currentSettings.brightness),
      home: HomePage(),
      routes: <String, WidgetBuilder>{
        "/AddPerson": (BuildContext context) => new AddPerson(),
        "/PersonDetail": (BuildContext context) => new PersonDetail(),
        "/Settings": (BuildContext context) => new SettingsPage(setTheme: setLightTheme),
      }
    );
  }
}
