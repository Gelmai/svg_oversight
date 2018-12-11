import 'package:flutter/material.dart';
import './pages/home_page.dart';
import './pages/add_person.dart';
import './pages/person_detail.dart';

void main() {
  runApp(
    new MaterialApp(
      home: new HomePage(),
      routes: <String, WidgetBuilder> {
        "/AddPerson": (BuildContext context) => new AddPerson(),
        "/PersonDetail": (BuildContext context) => new PersonDetail()
      }
    )
  );
}
