import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  final Function(int) onPressed;

  const CustomDrawer({Key key, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          ListTile(
            title: Text('Home'),
            onTap: () {
              onPressed(0);
            },
          ),
          ListTile(
            title: Text('Favorites'),
            onTap: () {
              onPressed(1);
            },
          ),
          ListTile(
            title: Text('Account'),
            onTap: () {
              onPressed(2);
            },
          ),
          ListTile(
            title: Text('Exit'),
          ),
        ],
      ),
    );
  }
}
