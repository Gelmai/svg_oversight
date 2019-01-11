import 'package:flutter/material.dart';
import './pages/home_page.dart';
import './pages/add_person.dart';
import './pages/person_detail.dart';
import './pages/settings_page.dart';
import './utils/settings.dart';
import './utils/storage.dart';

void main() async{
  bool isDarkTheme = false;
  ThemeData themeData;

  loadFile().then((String value) {
    setDarkTheme(themeData, isDarkTheme);
  });
  runApp(MyApp(themeData));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
  
  final ThemeData themeData;
  MyApp(this.themeData);
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: widget.themeData,
      home: HomePage(),
      routes: <String, WidgetBuilder> {
        "/AddPerson": (BuildContext context) => new AddPerson(),
        "/PersonDetail": (BuildContext context) => new PersonDetail(),
        "/Settings": (BuildContext context) => new Settings(),
      }
    );
  }
}