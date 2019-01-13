import 'package:flutter/material.dart';
import '../utils/settings.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
  final bool isDarkTheme;
  final ThemeData themeData;
  final String listSort;
  Settings(this.themeData, this.isDarkTheme, this.listSort);
}

class _SettingsState extends State<Settings> {
  bool _isDarkTheme;
  ThemeData _themeData;
  String _listSort;

  @override
  void initState() {
    _isDarkTheme = widget.isDarkTheme;
    _themeData = widget.themeData;
    _listSort = widget.listSort;
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
                  value: _isDarkTheme,
                  onChanged: (bool value) {
                    setState(() {
                      setDarkTheme(_themeData, value);
                      _isDarkTheme = value;
                    });
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
                value: _listSort,
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
