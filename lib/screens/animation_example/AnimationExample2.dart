import 'package:flutter/material.dart';
import 'package:my_flutter_showcase/screens/animation_example/ComponentsAnimationExample2.dart';

class AnimationExample2 extends StatefulWidget {
  @override
  _AnimationExample2State createState() => _AnimationExample2State();
}

class _AnimationExample2State extends State<AnimationExample2>
    with AnimationExample2Components {
  Widget _column() {
    return Column(
      children: <Widget>[
        logo(),
        inputUserName(),
        inputPassword(),
        textForgetPassword(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            _column(),
            buttonSignIn(),
          ],
        ),
      ),
    );
  }
}
