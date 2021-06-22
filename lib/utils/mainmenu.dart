import 'package:flutter/material.dart';

class MainMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 15.0,
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(12.0),
          ),
          InkWell(
            child: ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).pushNamed('/Settings');
            },
          )
        ],
      ),
    );
  }
}
