import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  final double width;
  final double height;
  final Color backgroundColor;
  final List<Icon> itens;

  const BottomBar(
      {Key key,
      this.itens,
      this.width = double.infinity,
      this.height = 60,
      this.backgroundColor = Colors.black45})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border.all(
          color: Colors.black12,
          style: BorderStyle.solid
        )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: itens
      ),
    );
  }
}
