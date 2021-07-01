import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:service_group/utils/person.dart';
import './pages/home_page.dart';
import './pages/add_person.dart';
import './pages/person_detail.dart';
import './pages/settings_page.dart';
import './utils/settings.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(SettingsAdapter());
  Hive.registerAdapter(PersonAdapter());
  var initSettings = await Hive.openBox('settings');
  var persons = await Hive.openBox('persons');
  if (initSettings.isEmpty) {
    initSettings.put('isDarkTheme', false);
    initSettings.put('key', 'Last Name A-Z');
  }
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<Settings>(
        create: (context) => Settings(
            isDarkTheme: initSettings.get('isDarkTheme'),
            listSort: initSettings.get('listSort')),
      ),
      ChangeNotifierProvider(
        create: (context) => Person(),
      )
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<Settings>(
      builder: (context, settings, __) => MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: settings.getTheme(),
          home: HomePage(),
          routes: <String, WidgetBuilder>{
            "/AddPerson": (BuildContext context) => new AddPerson(),
            "/PersonDetail": (BuildContext context) => new PersonDetail(),
            "/Settings": (BuildContext context) => new SettingsPage(),
          }),
    );
  }
}
