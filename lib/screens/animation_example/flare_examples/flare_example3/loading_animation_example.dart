import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class FlareBallDropLoadingAnimation extends StatefulWidget {
  @override
  _FlareBallDropLoadingAnimationState createState() =>
      _FlareBallDropLoadingAnimationState();
}

class _FlareBallDropLoadingAnimationState
    extends State<FlareBallDropLoadingAnimation> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.redAccent,
      child: Center(
        child: GestureDetector(
          onTap: null,
          child: FlareActor(
            'assets/animations/flare/example3_ball_drop_loading/ball_drop_loading.flr',
            animation: 'loading',
            alignment: Alignment.center,
            fit: BoxFit.contain,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
