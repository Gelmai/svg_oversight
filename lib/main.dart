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
  String listSort = 'Last Name A-Z';

  loadFile().then((String value) {
    setDarkTheme(themeData, isDarkTheme);
  });
  runApp(MyApp(themeData, isDarkTheme, listSort));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
  
  final ThemeData themeData;
  final bool isDarkTheme;
  final String listSort;
  MyApp(this.themeData, this.isDarkTheme, this.listSort);
}

class _MyAppState extends State<MyApp> {
  ThemeData _themeData;
  bool _isDarkTheme;
  String _listSort;
  

  @override
  void initState() {
    _themeData = widget.themeData;
    _isDarkTheme = widget.isDarkTheme;
    _listSort = widget.listSort;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: _themeData,
      home: HomePage(),
      routes: <String, WidgetBuilder> {
        "/AddPerson": (BuildContext context) => new AddPerson(),
        "/PersonDetail": (BuildContext context) => new PersonDetail(),
        "/Settings": (BuildContext context) => new Settings(_themeData, _isDarkTheme, _listSort),
      }
    );
  }
}