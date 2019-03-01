import 'package:flutter/material.dart';
import '../utils/settings.dart';
import '../main.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();

  final Function() setTheme;
  SettingsPage({Key key, @required this.setTheme}) : super(key: key) ;
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
                  value: isDarkTheme,
                  onChanged: (bool value) {
                    setState(() {
                      isDarkTheme = value;
                      widget.setTheme();
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
                  setState(() {listSort = value;});
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
