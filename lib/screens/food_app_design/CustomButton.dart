import 'package:flutter/material.dart';

class FoodAppDesignBoxImageCustomButton extends StatelessWidget {
  final double width;
  final double height;

  const FoodAppDesignBoxImageCustomButton(
      {Key key, this.width = 50, this.height = 50})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.green,
      borderRadius: BorderRadius.circular(8),
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: () {
          Scaffold.of(context).showSnackBar(SnackBar(
            content: Text("Tap"),
          ));
        },
        child: Container(
          width: width,
          height: height,
          alignment: Alignment.center,
          // color: Colors.green,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Text(
              "...",
              style: TextStyle(
                fontWeight: FontWeight.w900,
                letterSpacing: 2.3,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
