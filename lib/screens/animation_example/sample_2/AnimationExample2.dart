import 'package:flutter/material.dart';
import 'package:my_flutter_showcase/screens/animation_example/sample_2/ComponentsAnimationExample2.dart';

class AnimationExample2 extends StatefulWidget {
  @override
  _AnimationExample2State createState() => _AnimationExample2State();
}

class _AnimationExample2State extends State<AnimationExample2>
    with AnimationExample2Components, SingleTickerProviderStateMixin {
  AnimationController animController;
  Animation animTransformUsernameField;

  @override
  void initState() {
    super.initState();

    // Instanciando o controller da animação
    animController = AnimationController(
      duration: Duration(milliseconds: 1000),
      vsync: this,
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    animTransformUsernameField =
        Tween<double>(begin: 0, end: 400).animate(animController);
  }

  @override
  void dispose() {
    animController.dispose();
    super.dispose();
  }

  _signInOnTap() {
    if (animController.value > 0) {
      animController.reverse();
    } else {
      animController.forward();
    }
  }

  Widget _column() {
    return Column(
      children: <Widget>[
        logo(),
        AnimatedBuilder(
          animation: animTransformUsernameField,
          child: inputUserName(),
          builder: (BuildContext context, Widget child) {
            return Transform.translate(
                offset: Offset(animTransformUsernameField.value, 0.00),
                child: child);
          },
        ),
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
            buttonSignIn(
              onTap: _signInOnTap,
            ),
          ],
        ),
        // resizeToAvoidBottomInset: false,
        // resizeToAvoidBottomPadding: false,
      ),
    );
  }
}
