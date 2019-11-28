import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FirewatchParallaxMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Parallax",
      home: FirewatchParallaxHome(),
    );
  }
}

class FirewatchParallaxHome extends StatefulWidget {
  @override
  _FirewatchParallaxHomeState createState() => _FirewatchParallaxHomeState();
}

class _FirewatchParallaxHomeState extends State<FirewatchParallaxHome>
    with WidgetsBindingObserver {
  double rateZero = 0;
  double rateOne = 0;
  double rateTwo = 0;
  double rateTree = 0;
  double rateFour = 0;
  double rateFive = 0;
  double rateSix = 0;
  double rateSeven = 0;
  double rateEight = 90;

  String asset;
  double top;

  @override
  void initState() {
    super.initState();
    _landscapeModeOnly();
  }

  @override
  void dispose() {
    super.dispose();
    _portraitModeOnly();
  }

  void _landscapeModeOnly() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
  }

  void _portraitModeOnly() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      // user returned to our app
    } else if (state == AppLifecycleState.inactive) {
      // app is inactive
    } else if (state == AppLifecycleState.paused) {
      // user is about quit our app temporally
    } else if (state == AppLifecycleState.suspending) {
      // app suspended (not used in iOS)
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NotificationListener(
        // ignore: missing_return
        onNotification: (v) {
          //            only scrool update notification is triggered
          if (v is ScrollUpdateNotification) {
            setState(() {
              rateEight -= v.scrollDelta / 1;
              rateSeven -= v.scrollDelta / 1.5;
              rateSix -= v.scrollDelta / 2;
              rateFive -= v.scrollDelta / 2.5;
              rateFour -= v.scrollDelta / 3;
              rateTree -= v.scrollDelta / 3.5;
              rateTwo -= v.scrollDelta / 4;
              rateOne -= v.scrollDelta / 4.5;
              rateZero -= v.scrollDelta / 5;
            });
          }
        },
        child: Stack(
          children: <Widget>[
            new ParallaxWidget(top: rateZero, asset: "parallax0"),
            new ParallaxWidget(top: rateOne, asset: "parallax1"),
            new ParallaxWidget(top: rateTwo, asset: "parallax2"),
            new ParallaxWidget(top: rateTree, asset: "parallax3"),
            new ParallaxWidget(top: rateFour, asset: "parallax4"),
            new ParallaxWidget(top: rateFive, asset: "parallax5"),
            new ParallaxWidget(top: rateSix, asset: "parallax6"),
            new ParallaxWidget(top: rateSeven, asset: "parallax7"),
            new ParallaxWidget(top: rateEight, asset: "parallax8"),
            ListView(
              children: <Widget>[
                Container(
                  height: 600,
                  color: Colors.transparent,
                ),
                Container(
                  color: Color(0xff210002),
                  // color: Colors.blue,
                  width: double.infinity,
                  padding: EdgeInsets.only(top: 90),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Parallax In",
                        style: TextStyle(
                            fontSize: 30,
                            letterSpacing: 1.8,
                            color: Color(0xffffaf00)),
                      ),
                      Text(
                        "Flutter",
                        style: TextStyle(
                            fontSize: 51,
                            letterSpacing: 1.8,
                            color: Color(0xffffaf00)),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: 190,
                        child: Divider(
                          height: 1,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "\nMade By",
                        style: TextStyle(
                            fontSize: 20,
                            letterSpacing: 1.8,
                            color: Color(0xffffaf00)),
                      ),
                      Text(
                        "Thiago Silva",
                        style: TextStyle(
                            fontSize: 51,
                            letterSpacing: 1.8,
                            color: Color(0xffffaf00)),
                      ),
                      SizedBox(
                        height: 100,
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class ParallaxWidget extends StatelessWidget {
  const ParallaxWidget({
    Key key,
    @required this.top,
    @required this.asset,
  }) : super(key: key);

  final double top;
  final String asset;

  @override
  Widget build(BuildContext context) {
    return Positioned(
        left: -45,
        top: top,
        child: Container(
          height: 550,
          width: 900,
          child: Image.asset(
            "assets/images/firewatch_parallax/$asset.png",
            fit: BoxFit.cover,
          ),
        ));
  }
}
