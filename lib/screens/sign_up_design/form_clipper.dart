import 'package:flutter/material.dart';

class FormClipperSmall extends CustomClipper<Path> {
  final int pathId;

  FormClipperSmall({this.pathId = 0});

  @override
  Path getClip(Size size) {
    var path = Path();

    if (pathId == 0) {
      path.moveTo(0, size.height * 0.2);

      path.quadraticBezierTo(size.width * 0.25, size.height * 0.28,
          size.width * 0.59, size.height * 0.1);

      path.quadraticBezierTo(
          size.width * 0.79, 0, size.width, size.height * 0.13);

      path.lineTo(size.width, size.height);
      path.lineTo(0, size.height);
      path.close();
    } else if (pathId == 1) {}

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return oldClipper != this;
  }
}

class FormClipperLarge extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    path.moveTo(0, size.height * 0.2);

    path.quadraticBezierTo(size.width * 0.25, size.height * 0.28,
        size.width * 0.59, size.height * 0.1);

    path.quadraticBezierTo(
        size.width * 0.79, 0, size.width, size.height * 0.13);

    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return oldClipper != this;
  }
}
