import 'package:flutter/material.dart';
import '../utils/person.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();
}

int currentPersonId;

class _HomePageState extends State<HomePage> {
  
  @override
  void initState(){
    loadFile();
    setState(() {
    });       
    super.initState();
  }

  @override
  
  Widget build(BuildContext context) {
    return new Scaffold(
      floatingActionButton: new FloatingActionButton(
        onPressed: () => Navigator.of(context).pushNamed("/AddPerson"), 
        child: new Icon(Icons.add)), 
          appBar: new AppBar(title: new Text("Group Members")),
          body: new ListView.builder(
            itemCount: masterList.length,
            itemBuilder: (BuildContext context, int index) {
              return new Material(
                child: new InkWell(
                  onTap: () {
                    currentPersonId = index;
                    Navigator.of(context).pushNamed("/PersonDetail"); //masterList[i].firstName,
                  },
                  child: new ListTile(
                    leading: new Icon(Icons.person),
                    title: new Text("${masterList[index].lastName}, ${masterList[index].firstName}" , style: new TextStyle(fontSize: 30.0),)
                  )
                )
              );
            }
          )
    );
  }
}

