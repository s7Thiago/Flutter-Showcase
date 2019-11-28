import 'package:flutter/material.dart';

class Dot extends StatelessWidget {
  final Color color;
  final double width;
  final double height;

  const Dot(
      {Key key, this.height = 10, this.width = 10, this.color = Colors.black12})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double currentDotSizeAddictional = 2;
    return Container(
      width:
          color == Colors.black12 ? width : width + currentDotSizeAddictional,
      height:
          color == Colors.black12 ? height : height + currentDotSizeAddictional,
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(32)),
    );
  }
}