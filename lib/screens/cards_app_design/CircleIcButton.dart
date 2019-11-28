import 'package:flutter/material.dart';

class CircleIcButton extends StatelessWidget {
  final double buttonRadius;
  final IconData icon;
  final Color color;
  final Color iconColor;

  const CircleIcButton(
      {Key key,
      this.iconColor = Colors.black,
      this.color = Colors.blueGrey,
      this.icon = Icons.add,
      this.buttonRadius = 20})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: buttonRadius,
      height: buttonRadius,
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(buttonRadius * 2),
          boxShadow: [
            BoxShadow(
              color: Colors.black54,
              spreadRadius: 0.5,
              blurRadius: 20
            )
          ]),
      child: Icon(
        icon,
        color: iconColor,
        size: buttonRadius / 3.2,
      ),
      alignment: Alignment.center,
    );
  }
}