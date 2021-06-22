import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:service_group/utils/settings.dart';
import '../utils/person.dart';
import '../utils/mainmenu.dart';
import '../utils/storage.dart';

int currentIndex;

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Settings hive = Settings();
    hive.isDarkTheme = Hive.box('settings').get('isDarkTheme');
    hive.listSort = Hive.box('settings').get('listSort');
    Settings settings = Provider.of<Settings>(context);

    return Scaffold(
      endDrawer: MainMenu(),
      persistentFooterButtons: [
        ElevatedButton(
          onPressed: () => settings.saveSettings(settings),
          child: Text('Save'),
        ),
        ElevatedButton(
          onPressed: () => settings.loadSettings(settings),
          child: Text('Load'),
        ),
        ElevatedButton(
          onPressed: () {
            print('---------------------------');
            print('currentSettings.isDarkTheme = ${settings.isDarkTheme}');
            print('currentSettings.listSort = ${settings.listSort}');
            print('Hive.box(settings).isDarkTheme = ${hive.isDarkTheme}');
            print('Hive.box(settings).listSort = ${hive.listSort}');

            for (var i = 0; i < masterList.length; i++) {
              print(
                  '${masterList[i].lastName} ${masterList[i].lastShepherded}');
            }
            settings.saveSettings(settings);
          },
          child: Text('Print'),
        )
      ],
      floatingActionButton: new FloatingActionButton(
          onPressed: () => Navigator.of(context).pushNamed("/AddPerson"),
          child: new Icon(Icons.add)),
      appBar: new AppBar(title: new Text("Group Members")),
      body: Consumer<Settings>(
        builder: (context, value, child) {
          return FutureBuilder(
              future: listLoaded(),
              initialData: 'Loading...',
              // ignore: missing_return
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (masterList == null) {
                  return Container(
                    color: Colors.redAccent[100],
                  );
                } else {
                  if (snapshot.hasData) {
                    if (snapshot.data != null) {
                      return ListView.builder(
                          itemCount: masterList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return new Material(
                              child: new InkWell(
                                  onTap: () {
                                    currentIndex = index;
                                    Navigator.of(context).pushNamed(
                                        "/PersonDetail"); //masterList[i].firstName,
                                  },
                                  child: new ListTile(
                                      key: Key(masterList[index]
                                          .personId
                                          .toString()),
                                      leading: CircleAvatar(
                                        backgroundColor: Colors.indigo[100],
                                        child: Text(
                                          '${masterList[index].firstName.substring(0, 1)}${masterList[index].lastName.substring(0, 1)}',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 20.0),
                                        ),
                                      ),
                                      title: new Text(
                                        "${masterList[index].lastName}, ${masterList[index].firstName}",
                                        style: new TextStyle(fontSize: 25.0),
                                      ),
                                      trailing: Text(
                                          '${DateTime.parse(masterList[index].lastShepherded).month}-${DateTime.parse(masterList[index].lastShepherded).day}-${DateTime.parse(masterList[index].lastShepherded).year}'))),
                            );
                          });
                    }
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                }
              });
        },
      ),
    );
  }
}
