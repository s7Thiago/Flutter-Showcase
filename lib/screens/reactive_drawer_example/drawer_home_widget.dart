import 'package:flutter/material.dart';
import 'package:my_flutter_showcase/screens/reactive_drawer_example/custom_drawer.dart';

class ReactiveDrawerHomeWidget extends StatefulWidget {
  @override
  _ReactiveDrawerHomeWidgetState createState() =>
      _ReactiveDrawerHomeWidgetState();
}

class _ReactiveDrawerHomeWidgetState extends State<ReactiveDrawerHomeWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Navegação'),
      ),
      drawer: CustomDrawer(),
    );
  }
}
