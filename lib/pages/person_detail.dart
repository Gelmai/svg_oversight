import 'package:flutter/material.dart';
import './home_page.dart';
import '../utils/person.dart';

class PersonDetail extends StatefulWidget {
  @override
  _PersonDetailState createState() => new _PersonDetailState();
}

class _PersonDetailState extends State<PersonDetail> {
  

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar( centerTitle: true, title: new Text(masterList[currentPersonId].firstName +" "+ masterList[currentPersonId].lastName),),
      body: new Text("Person Id: " + currentPersonId.toString())
       
    );
  }
}