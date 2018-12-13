import 'package:flutter/material.dart';
import '../utils/person.dart';

class AddPerson extends StatefulWidget {
  @override
  _AddPersonState createState() => new _AddPersonState();
}


class _AddPersonState extends State<AddPerson> {
  
String nameFirst = "";
String nameLast = "";
final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

void createSnackBar(String message) {
  final snackBar = SnackBar(content: Text(message),);
  scaffoldKey.currentState.showSnackBar(snackBar);
}
  
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: scaffoldKey,
      appBar: new AppBar(title: new Text("New goup member"),),
      floatingActionButton: new FloatingActionButton(
        child: new Icon(Icons.check), 
        onPressed: () {
          if (nameFirst == "" || nameLast == "") {
            createSnackBar('Name fields are required!');
          } else {
            addPerson(nameFirst, nameLast);
            Navigator.of(context).pop();
            createSnackBar(masterList[personCounter - 1].firstName + 'added');
          }
        }),
      body: new Material(
          child: new Container(
            padding: new EdgeInsets.symmetric( horizontal: 10.0),
            child: Column(
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