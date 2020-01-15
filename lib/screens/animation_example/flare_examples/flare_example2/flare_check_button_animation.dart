import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class CheckButtonFlareAnim extends StatefulWidget {
  @override
  _CheckButtonFlareAnimState createState() => _CheckButtonFlareAnimState();
}

class _CheckButtonFlareAnimState extends State<CheckButtonFlareAnim> {
  String _currentAnimation = 'checked';

  _swithAnimation() {
    setState(() {
      switch (_currentAnimation) {
        case 'checked':
          _currentAnimation = 'checked to error';
          break;

        case 'checked to unchecked':
          _currentAnimation = 'checked';
          break;

        default:
          _currentAnimation = 'checked to unchecked';
          break;
      }
      print('current animation: $_currentAnimation');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: _currentAnimation == 'checked'
            ? GestureDetector(
                onTap: _swithAnimation,
                child: FlareActor(
                  'assets/animations/flare/example2_check_button/Check_button.flr',
                  fit: BoxFit.contain,
                  animation: 'checked to unchecked',
                  // color: Colors.white,
                ),
              )
            : GestureDetector(
                onTap: _swithAnimation,
                child: FlareActor(
                  'assets/animations/flare/example2_check_button/Check_button.flr',
                  fit: BoxFit.contain,
                  animation: 'checked',
                  // color: Colors.white,
                ),
              ),
      ),
    );
  }
}
