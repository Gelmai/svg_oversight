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
      body: new Center(
        child: Column(
          children: <Widget>[
            Text("Person Id: " + currentPersonId.toString(), style: new TextStyle(fontSize: 30.0), ),
            RaisedButton(
              child: Text('Delete Person'),
              onPressed: () {
                deletePerson(currentPersonId);
                Navigator.of(context).pop();
              },
            )
          ],
        ) 
      )
    );
  }
}