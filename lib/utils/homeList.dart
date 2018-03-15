import 'package:flutter/material.dart';
import '../pages/add_person.dart';
import '../pages/home_page.dart';
import './person.dart';

class HomeList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    

  
//List<Widget> homeList() {
  
  List<Widget> tiles = [];
  int counter = masterList.length;
  
  

  for (int i = 0; i < counter; i++) {
    
    tiles.add(
      new Material(
        child: new InkWell(
          onTap: () => Scaffold.of() .showSnackBar(new SnackBar( content: new Text("data"),)) , //Navigator.of(context).pushNamed("/PersonDetail"), //masterList[i].firstName,
          child: new ListTile(
            leading: new Icon(Icons.person),
            title: new Text("${masterList[i].lastName}, ${masterList[i].firstName}" , style: new TextStyle(fontSize: 30.0),)
          )
        )
      )
    );
    
  }
  return new Column(children: tiles,);
}
}