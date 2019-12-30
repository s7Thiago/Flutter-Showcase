import 'package:flutter/material.dart';
import 'package:my_flutter_showcase/screens/animation_example/sample_2/ComponentsAnimationExample2.dart';

class AnimationExample2 extends StatefulWidget {
  @override
  _AnimationExample2State createState() => _AnimationExample2State();
}

class _AnimationExample2State extends State<AnimationExample2>
    with AnimationExample2Components, SingleTickerProviderStateMixin {
  AnimationController animController;
  Animation<double> animTransformUsernameField;
  Animation<double> animTransformPasswordField;
  Animation<double> animOpacityForgetPasswordText;
  Animation<double> animButtonSignInCircular;
  Animation<double> animButtonSignInWidth;

  @override
  void initState() {
    super.initState();

    // Instanciando o controller da animação
    animController = AnimationController(
      duration: Duration(milliseconds: 2000),
      vsync: this,
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // Configurando onde será estado inicial e final animação do campo de email
    //Um curvedAnimation serve para executar a animação em uum tempo diferente e com uma interpolação diferenciada
    animTransformUsernameField =
        Tween<double>(begin: 0, end: MediaQuery.of(context).size.width * 1)
            .animate(CurvedAnimation(
                parent: animController,
                curve: Interval(0, 0.5, curve: Curves.easeInCubic)));

    // Configurando onde será estado inicial e final animação do campo de senha
    animTransformPasswordField =
        Tween<double>(begin: 0, end: MediaQuery.of(context).size.width * -1)
            .animate(CurvedAnimation(
                curve: Interval(0, 0.65, curve: Curves.easeInCirc),
                parent: animController));
    // Configurando onde será estado inicial e final animação do texto 'Forget Passowrd?'
    animOpacityForgetPasswordText =
        Tween<double>(begin: 1, end: 0).animate(CurvedAnimation(
      parent: animController,
      curve: Interval(0.7, 0.95, curve: Curves.easeInSine),
    ));

    // Configurando animações do botão Sign In
    animButtonSignInCircular =
        Tween<double>(begin: 8.0, end: 50).animate(CurvedAnimation(
      parent: animController,
      curve: Interval(0, 0.4, curve: Curves.ease),
    ));

    animButtonSignInWidth =
        Tween<double>(begin: MediaQuery.of(context).size.width, end: 50)
            .animate(CurvedAnimation(
      parent: animController,
      curve: Interval(0, 0.4, curve: Curves.easeInOutCirc),
    ));
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
        AnimatedBuilder(
          animation: animTransformPasswordField,
          child: inputPassword(),
          builder: (BuildContext context, Widget child) {
            return Transform.translate(
              offset: Offset(animTransformPasswordField.value, 0.00),
              child: child,
            );
          },
        ),
        AnimatedBuilder(
          animation: animOpacityForgetPasswordText,
          child: textForgetPassword(),
          builder: (BuildContext context, Widget child) {
            return Opacity(
              opacity: animOpacityForgetPasswordText.value,
              child: child,
            );
          },
        ),
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
            AnimatedBuilder(
              animation: animController,
              builder: (BuildContext context, Widget child) {
                return buttonSignIn(
                  onTap: _signInOnTap,
                  width: animButtonSignInWidth.value,
                  circular: animButtonSignInCircular.value,
                  isLoading: animButtonSignInCircular.value > 8,
                );
              },
            ),
          ],
        ),
        // resizeToAvoidBottomInset: false,
        // resizeToAvoidBottomPadding: false,
      ),
    );
  }
}
