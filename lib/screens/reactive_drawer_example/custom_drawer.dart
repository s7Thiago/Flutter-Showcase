import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          ListTile(
            title: Text('Home'),
          ),
          ListTile(
            title: Text('Favorites'),
          ),
          ListTile(
            title: Text('Account'),
          ),
          ListTile(
            title: Text('Exit'),
          ),
        ],
      ),
    );
  }
}
