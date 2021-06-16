import 'package:flutter/material.dart';
import 'package:service_group/utils/storage.dart';
import 'home_page.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();

  SettingsPage({Key key, @required this.themeNotifier}) : super(key: key);
  final themeNotifier;
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: ListView(
        children: <Widget>[
          Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(10.0),
              ),
              Expanded(child: Text('Enable dark theme')),
              Switch(
                  value: currentSettings.isDarkTheme,
                  onChanged: (bool value) {
                    setState(() {
                      if (value == true) {
                        widget.themeNotifier.setDarkTheme();
                      } else {
                        widget.themeNotifier.setLightTheme();
                      }
                    });
                  })
            ],
          ),
          Divider(),
          Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(10.0),
              ),
              Expanded(child: Text('List sort')),
              DropdownButton(
                value: currentSettings.listSort,
                items: <DropdownMenuItem>[
                  DropdownMenuItem(
                    child: Text('Last Name A-Z'),
                    value: 'Last Name A-Z',
                  ),
                  DropdownMenuItem(
                    child: Text('Last Name Z-A'),
                    value: 'Last Name Z-A',
                  ),
                  DropdownMenuItem(
                    child: Text('Shepherding Date A-Z'),
                    value: 'Shepherding Date A-Z',
                  ),
                  DropdownMenuItem(
                      child: Text('Shepherding Date Z-A'),
                      value: 'Shepherding Date Z-A'),
                ],
                onChanged: (dynamic value) {
                  setState(() {
                    currentSettings.listSort = value;
                    currentSettings.setListSort(value);
                    saveSettings();
                  });
                },
              ),
            ],
          ),
          Divider(),
        ],
      ),
    );
  }
}
