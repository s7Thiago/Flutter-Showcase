import 'package:flutter/material.dart';

class Field extends StatelessWidget {
  final String hint;
  final bool spaceTop;
  final TextInputAction textInputAction;
  final FocusNode focusNode;
  final TextInputType keyboardType;
  final TextEditingController controller;
  final Function onFieldSubmitted;

  const Field(
      {Key key,
      this.hint = "Field",
      this.spaceTop = false,
      this.textInputAction = TextInputAction.next,
      this.focusNode,
      this.keyboardType = TextInputType.text,
      this.controller,
      this.onFieldSubmitted})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: !spaceTop ? 0 : MediaQuery.of(context).size.height * 0.015),
      child: TextFormField(
        decoration: InputDecoration(
          border: UnderlineInputBorder(),
          fillColor: Color(0xff9AC3E8),
          hintText: hint,
          hintStyle:
              TextStyle(color: Color(0xff1756AF), fontWeight: FontWeight.bold),
        ),
        textInputAction: textInputAction,
        focusNode: focusNode,
        keyboardType: keyboardType,
        onFieldSubmitted: onFieldSubmitted,
      ),
    );
  }
}
