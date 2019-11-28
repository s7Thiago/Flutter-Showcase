import 'package:flutter/material.dart';

class Space extends StatelessWidget {
   final double width;
   final double height;

  const Space({Key key, this.width = 0, this.height = 0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
    );
  }
}
