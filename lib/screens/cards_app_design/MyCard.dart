import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  final double width;
  final double height;
  final double borderRadius;
  final Color color;
  final Widget child;
  final bool activateShadow;

  const MyCard(
      {Key key,
      this.activateShadow = true,
      this.color = Colors.white,
      this.child,
      this.width = 150,
      this.height = 150,
      this.borderRadius = 8})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: activateShadow ? Colors.black54 : Colors.transparent,
              blurRadius: 30),
        ],
      ),
      child: child,
    );
  }
}
