import 'package:flutter/material.dart';

import '../firewatch_parallax/firewatch_parallax_main.dart'
    as fireWatchParallaxUil;

class HomeSimpleParallax extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Teste",
      debugShowCheckedModeBanner: false,
      home: HomePageSimpleParallaxExample(),
    );
  }
}

class HomePageSimpleParallaxExample extends StatefulWidget {
  @override
  _HomePageSimpleParallaxExampleState createState() =>
      _HomePageSimpleParallaxExampleState();
}

class _HomePageSimpleParallaxExampleState
    extends State<HomePageSimpleParallaxExample> {
  double topOne = 0;
  double topTwo = 100;
  double topTree = 200;
  double topFor = 300;

  @override
  void initState() {
    super.initState();
    // fireWatchParallaxUil.FirewatchParallaxHome().takeLandscapeModeOnly();
  }

  @override
  void dispose() {
    super.dispose();
    fireWatchParallaxUil.FirewatchParallaxHome().takePortraitModeOnly();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NotificationListener(
        // ignore: missing_return
        onNotification: (v) {
          if (v is ScrollUpdateNotification) {
//            only scrool update notification is triggered
            setState(() {
              topOne = topOne - v.scrollDelta / 3;
              topTwo = topTwo - v.scrollDelta / 1;
              topTree = topTree - v.scrollDelta / 0.5;
              topFor = topFor - v.scrollDelta / 0.25;
            });
          }
        },
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Positioned(
              top: topOne,
              left: 0,
              child: Container(
                height: 100,
                width: 100,
                color: Colors.red,
              ),
            ),
            Positioned(
                top: topTwo,
                left: 100,
                child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.green,
                )),
            Positioned(
                top: topTree,
                left: 200,
                child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.amber,
                )),
            Positioned(
                top: topFor,
                left: 300,
                child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.blue,
                )),
            ListView(
              children: <Widget>[
                Container(
                  height: 600,
                  color: Colors.transparent,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
