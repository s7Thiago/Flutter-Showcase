import 'package:flutter/material.dart';

class Field extends StatelessWidget {
  final String hint;
  final bool spaceTop;

  const Field({Key key, this.hint = "Field", this.spaceTop = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: !spaceTop ? 0 : MediaQuery.of(context).size.height * 0.015),
      child: TextField(
        decoration: InputDecoration(
          border: UnderlineInputBorder(),
          fillColor: Color(0xff9AC3E8),
          hintText: hint,
          hintStyle:
              TextStyle(color: Color(0xff1756AF), fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
