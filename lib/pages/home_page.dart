import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:service_group/pages/person_detail.dart';
import 'package:service_group/utils/person.dart';
import 'package:service_group/utils/settings.dart';
import 'package:service_group/utils/storage.dart';
import '../utils/mainmenu.dart';

int currentIndex;

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Settings settingsBox = Settings();
    settingsBox.isDarkTheme = Hive.box('settings').get('isDarkTheme');
    settingsBox.listSort = Hive.box('settings').get('listSort');
    Settings settingsProvider = Provider.of<Settings>(context);
    var persons = Hive.box('persons');

    return Scaffold(
      endDrawer: MainMenu(),
      floatingActionButton: new FloatingActionButton(
          onPressed: () => Navigator.of(context).pushNamed("/AddPerson"),
          child: new Icon(Icons.add)),
      appBar: new AppBar(title: new Text("Group Members")),
      body: Consumer2<Settings, Person>(
        builder: (context, settings, person, child) {
          return FutureBuilder(
            future: Hive.openBox('persons'),
            initialData: 'Loading...',
            // ignore: missing_return
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasError) {
                  return Text(snapshot.error.toString());
                } else {
                  if (snapshot.hasData) {
                    if (snapshot.data != null) {
                      return ListView.builder(
                          itemCount: persons.length,
                          itemBuilder: (BuildContext context, int index) {
                            return new Material(
                              child: new InkWell(
                                  onTap: () {
                                    //Navigator.of(context).pushNamed(
                                    //    "/PersonDetail"); //masterList[i].firstName,

                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                            builder: (context) => PersonDetail(
                                                  index: index,
                                                )));
                                  },
                                  child: new ListTile(
                                      key: Key(persons.keyAt(index).toString()),
                                      //masterList[index]
                                      //  .personId
                                      //  .toString()),
                                      leading: CircleAvatar(
                                        backgroundColor: Colors.indigo[100],
                                        child: Text(
                                          '${persons.getAt(index).firstName.substring(0, 1)}${persons.getAt(index).lastName.substring(0, 1)}',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 20.0),
                                        ),
                                      ),
                                      title: new Text(
                                        "${persons.getAt(index).lastName}, ${persons.getAt(index).firstName}",
                                        style: new TextStyle(fontSize: 25.0),
                                      ),
                                      trailing: Text(
                                          '${DateTime.parse(persons.getAt(index).lastShepherded).month}-${DateTime.parse(persons.getAt(index).lastShepherded).day}-${DateTime.parse(persons.getAt(index).lastShepherded).year}'))),
                            );
                          });
                    }
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                }
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          );
        },
      ),
      persistentFooterButtons: [
        ElevatedButton(
          onPressed: () => settingsProvider.saveSettings(settingsProvider),
          child: Text('Save'),
        ),
        ElevatedButton(
          onPressed: () => settingsProvider.loadSettings(settingsProvider),
          child: Text('Load'),
        ),
        ElevatedButton(
          onPressed: () {
            print('---------------------------');
            print(
                'Hive.box(settings).isDarkTheme = ${settingsBox.isDarkTheme}');
            print('Hive.box(settings).listSort = ${settingsBox.listSort}');

            for (var i = 0; i < persons.length; i++) {
              print(
                  '${persons.getAt(i).lastName} ${persons.getAt(i).lastShepherded}');
            }
            settingsProvider.saveSettings(settingsProvider);
          },
          child: Text('Print'),
        )
      ],
    );
  }
}
