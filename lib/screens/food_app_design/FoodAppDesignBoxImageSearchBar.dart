import 'package:flutter/material.dart';

import 'CustomButton.dart';

class FoodAppDesignBoxImageSearchBar extends StatefulWidget {
  @override
  _FoodAppDesignBoxImageSearchBarState createState() =>
      _FoodAppDesignBoxImageSearchBarState();
}

class _FoodAppDesignBoxImageSearchBarState
    extends State<FoodAppDesignBoxImageSearchBar> {
  double mainContainerHeight = 60;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: mainContainerHeight,
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 15),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius:
              BorderRadius.circular(MediaQuery.of(context).size.width * 0.015)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 10),
            child: Icon(Icons.search),
          ),
          Flexible(
            child: TextField(
              decoration:
                  InputDecoration.collapsed(hintText: "Search for dishes"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
            child: FoodAppDesignBoxImageCustomButton(
              width: 40,
              height: 40,
            ),
          ),
        ],
      ),
    );
  }
}
