import 'package:flutter/material.dart';
import '../utils/settings.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
  // final bool isDarkTheme;
  // final ThemeData themeData;
  // final String listSort;
  // SettingsPage(this.themeData, this.isDarkTheme, this.listSort);
}

class _SettingsPageState extends State<SettingsPage> {
  
  // ThemeData _themeData;
  String _listSort;

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
                  value: isDarkTheme,
                  onChanged: (bool value) {
                      isDarkTheme = value;
                  }),
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
                value: listSort,
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
                  setListSort(value);
                  _listSort = value;
                  setState(() {});
                },
              )
            ],
          ),
          Divider(),
        ],
      ),
    );
  }
}
