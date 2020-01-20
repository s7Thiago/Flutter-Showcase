import 'package:flutter/material.dart';

class DrawerHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Home Page',
        style: Theme.of(context).textTheme.body1,
      ),
    );
  }
}
