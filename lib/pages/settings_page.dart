import 'package:flutter/material.dart';
import '../utils/settings.dart';

class Settings extends StatefulWidget {
  @override
  
  _SettingsState createState() => _SettingsState();
  final bool isDarkTheme;
  final ThemeData themeData;
  Settings({this.themeData, this.isDarkTheme});
}


class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Settings'),),
      body: ListView(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(child: Text('Enable dark theme')),
              Switch(
                value: widget.isDarkTheme,
                onChanged: (bool value) {
                  setState(() {
                   setDarkTheme(widget.themeData, value);
                 });
                }
              ),
            ],
          ),
          Divider(),
          Row(
            children: <Widget>[
              Expanded(child: Text('List sort')),
              DropdownButton(
                value: listSort,
                items: <DropdownMenuItem>[
                  DropdownMenuItem(child: Text('Last Name A-Z'), value: 'lname A',),
                  DropdownMenuItem(child: Text('Last Name Z-A'), value: 'lname Z',),
                  DropdownMenuItem(child: Text('Shepherding Date A-Z'), value: 'sdate A',),
                  DropdownMenuItem(child: Text('Shepherding Date Z-A'), value: 'sdate Z'),
                ],
                onChanged: (dynamic value) {
                  setListSort(value);
                  setState(() {
                    
                  });
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