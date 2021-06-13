import 'package:flutter/material.dart';
import 'package:service_group/utils/storage.dart';
import '../utils/person.dart';

class AddPerson extends StatefulWidget {
  @override
  _AddPersonState createState() => new _AddPersonState();
}

class _AddPersonState extends State<AddPerson> {
  String nameFirst = "";
  String nameLast = "";
  final _formKey = GlobalKey<FormState>();

  void createSnackBar(String message, BuildContext context) {
    final snackBar = SnackBar(
      content: Text(message),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("New goup member"),
      ),
      floatingActionButton: Builder(builder: (BuildContext context) {
        return FloatingActionButton(
            child: new Icon(Icons.check),
            onPressed: () {
              if (nameFirst == "" || nameLast == "") {
                createSnackBar('Name fields are required!', context);
              } else {
                addPerson(nameFirst, nameLast);
                saveSettings();
                Navigator.pushNamed(context, '/');
                setState(() {});
              }
            });
      }),
      body: Material(
        child: new Container(
          padding: new EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            children: [
              Form(
                key: _formKey,
                child: Column(children: <Widget>[
                  new Padding(
                    padding: new EdgeInsets.symmetric(vertical: 10.0),
                  ),
                  new TextFormField(
                    autofocus: true,
                    decoration: new InputDecoration(hintText: "First name"),
                    onChanged: (String str) {
                      nameFirst = str;
                    },
                  ),
                  new Padding(
                    padding: new EdgeInsets.symmetric(vertical: 10.0),
                  ),
                  new TextFormField(
                    decoration: new InputDecoration(hintText: "Last name"),
                    onChanged: (String str) {
                      nameLast = str;
                    },
                  ),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
