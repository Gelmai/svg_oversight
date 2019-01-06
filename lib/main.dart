import 'package:flutter/material.dart';
import './pages/home_page.dart';
import './pages/add_person.dart';
import './pages/person_detail.dart';
import './pages/settings.dart';

void main() {
  runApp(
    new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new HomePage(),
      routes: <String, WidgetBuilder> {
        "/AddPerson": (BuildContext context) => new AddPerson(),
        "/PersonDetail": (BuildContext context) => new PersonDetail(),
        "/Settings": (BuildContext context) => new Settings(),
      }
    )
  );
}
