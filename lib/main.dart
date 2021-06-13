import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './pages/home_page.dart';
import './pages/add_person.dart';
import './pages/person_detail.dart';
import './pages/settings_page.dart';
import './utils/settings.dart';
import './utils/storage.dart';

void main() async {
  loadSettings();
  loadPersons().then((String value) {
    runApp(ChangeNotifierProvider<ThemeNotifier>(
      create: (context) => ThemeNotifier(),
      child: MyApp(),
    ));
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(
      builder: (context, themeNotifier, __) => MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: themeNotifier.getTheme(),
          home: HomePage(),
          routes: <String, WidgetBuilder>{
            "/AddPerson": (BuildContext context) => new AddPerson(),
            "/PersonDetail": (BuildContext context) => new PersonDetail(),
            "/Settings": (BuildContext context) => new SettingsPage(
                  themeNotifier: themeNotifier,
                ),
          }),
    );
  }
}