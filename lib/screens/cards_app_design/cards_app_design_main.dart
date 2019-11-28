import 'package:flutter/material.dart';
import 'package:my_flutter_showcase/screens/cards_app_design/MyHomePage.dart';

void main() => runApp(CardsAppDesignMain());

class CardsAppDesignMain extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: CardsAppDesignHomePage(),
      ),
    );
  }
}
