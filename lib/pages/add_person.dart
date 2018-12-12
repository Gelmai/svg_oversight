import 'package:flutter/material.dart';
import '../utils/person.dart';

class AddPerson extends StatefulWidget {
  @override
  _AddPersonState createState() => new _AddPersonState();
}


class _AddPersonState extends State<AddPerson> {
  
String nameFirst = "";
String nameLast = "";


  
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("New goup member"),),
      floatingActionButton: new FloatingActionButton(
        child: new Icon(Icons.check), 
        onPressed: () {
          if (nameFirst <> "" || nameLast <> "") {
            addPerson(nameFirst, nameLast);
            new SnackBar(content: new Text(masterList[personCounter - 1].firstName + " added"),);
            Navigator.of(context).pop();
          } else {
            Scaffold.of(context).showSnackBar(SnackBar(content: Text('Name fields are required')));
          }
          
        }),
      body: new Material(
        child: new Container(
          padding: new EdgeInsets.symmetric( horizontal: 10.0),
          child: new Column(
            children: <Widget>[
              new Padding(padding: new EdgeInsets.symmetric(vertical: 10.0),),
              new TextField(
                decoration: new InputDecoration(
                  hintText: "First name"
                ),
                onChanged: (String str) {
                  setState(() {
                    nameFirst = str;
                  });
                },
              ),
              new Padding(padding: new EdgeInsets.symmetric(vertical: 10.0),),
              new TextField(
                decoration: new InputDecoration(
                  hintText: "Last name"
                ),
                onChanged: (String str) {
                  setState(() {
                    nameLast = str;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}