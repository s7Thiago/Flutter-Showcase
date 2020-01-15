import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class FlareAndroidLogoAnim extends StatefulWidget {
  @override
  _FlareAndroidLogoAnimState createState() => _FlareAndroidLogoAnimState();
}

class _FlareAndroidLogoAnimState extends State<FlareAndroidLogoAnim> {
  String _currentAnimation = 'bye';

  _swithAnimation() {
    setState(() {
      _currentAnimation = _currentAnimation == 'jump' ? 'bye' : 'jump';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.deepOrange,
      child: Center(
        child: GestureDetector(
          onTap: _swithAnimation,
          child: FlareActor(
            'assets/animations/flare/example1_android_logo/Android.flr',
            fit: BoxFit.contain,
            animation: _currentAnimation,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
