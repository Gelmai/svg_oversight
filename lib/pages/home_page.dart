import 'package:flutter/material.dart';
import '../utils/homeList.dart';



class HomePage extends StatefulWidget {
  
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  @override
  
  Widget build(BuildContext context) {
  final key = new GlobalKey<ScaffoldState>();
    return new Scaffold(
      key: key,
      floatingActionButton: new FloatingActionButton(
        onPressed: () => Navigator.of(context).pushNamed("/AddPerson"), 
        child: new Icon(Icons.add)), 
      appBar: new AppBar(title: new Text("Group Members")),
      body: new ListView(
        children: new HomeList()
      ),
    );
  }
}
