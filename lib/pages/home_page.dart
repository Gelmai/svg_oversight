import 'package:flutter/material.dart';
import '../utils/person.dart';
import 'add_person.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();
}

int currentIndex;


class _HomePageState extends State<HomePage> {
  
  @override 
  void initState(){
    super.initState();
    loadFile();
  }

  @override
  
  Widget build(BuildContext context) {
    return new Scaffold(
      floatingActionButton: new FloatingActionButton(
        onPressed: () => Navigator.of(context).pushNamed("/AddPerson"), 
        child: new Icon(Icons.add)), 
          appBar: new AppBar(title: new Text("Group Members")),
          body: FutureBuilder(
            future: listLoaded(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (masterList == null) {
                return Container(
                  color: Colors.redAccent[100],
                );
              } else {
                if (snapshot.hasData) {
                  if (snapshot.data!=null) {
                    return ListView.builder(
                      itemCount: masterList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return new Material(
                          child: new InkWell(
                            onTap: () {
                              currentIndex = index;
                              Navigator.of(context).pushNamed("/PersonDetail"); //masterList[i].firstName,
                            },
                            child: new ListTile(
                              key: Key(masterList[index].personId.toString()),
                              leading: CircleAvatar(
                                backgroundColor: Colors.indigo[100],
                                child: Text('${masterList[index].firstName.substring(0,1)}${masterList[index].lastName.substring(0,1)}',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20.0
                                  ),
                                  ),  
                              ),
                              title: new Text("${masterList[index].lastName}, ${masterList[index].firstName}" , style: new TextStyle(fontSize: 30.0),)
                            )
                          ),
                        );
                      }
                    );
                  } 
                } else {
                  return Center(
                    child: CircularProgressIndicator()
                  );
                }
              }
            }
          )
    );
  }
}

