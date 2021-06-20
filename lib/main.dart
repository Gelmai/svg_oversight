import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import './pages/home_page.dart';
import './pages/add_person.dart';
import './pages/person_detail.dart';
import './pages/settings_page.dart';
import './utils/settings.dart';
import './utils/storage.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(SettingsAdapter());
  await Hive.openBox('settings');
  //loadSettings();

  loadPersons().then((String value) {
    runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider<Settings>(create: (context) => Settings()),
        ChangeNotifierProvider<ThemeNotifier>(
            create: (context) => ThemeNotifier())
      ],
      builder: (context, child) {
        final settings = context.watch<Settings>();
        final theme = context.watch<ThemeNotifier>();
        return MyApp();
      },
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
