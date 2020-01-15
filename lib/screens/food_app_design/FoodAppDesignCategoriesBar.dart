import 'package:flutter/material.dart';

// ignore: must_be_immutable
class FoodAppDesignCategoriesBar extends StatelessWidget {
  List<CategoriesBarItem> itens;

  FoodAppDesignCategoriesBar({this.itens});

  List<CategoriesBarItem> takeList() => itens;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 75,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            child: itens[index],
            onTap: () {
              print("List GestureDetector called onTap()");
            },
          );
        },
        itemCount: itens.length,
      ),
    );
  }
}

class CategoriesBarItem extends StatefulWidget {
  @override
  _CategoriesBarItemState createState() => _CategoriesBarItemState();
}

class _CategoriesBarItemState extends State<CategoriesBarItem> {
  bool isSelected = false;
  final IconData icon;
  final String text;

  _CategoriesBarItemState({this.icon = Icons.ac_unit, this.text = "Text"});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Material(
        color: isSelected ? Colors.green : Colors.black12,
        elevation: isSelected ? 10 : 0,
        borderRadius: BorderRadius.circular(8),
        child: InkWell(
          onTap: () {
            setState(() {
              isSelected ? isSelected = false : isSelected = true;
            });
          },
          highlightColor: isSelected ? Colors.greenAccent : Colors.black26,
          borderRadius: BorderRadius.circular(8),
          child: Container(
            width: 65,
            height: 100,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Icon(
                  icon,
                  color: isSelected ? Colors.white : Colors.black12,
                ),
                Text(
                  text,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: isSelected ? Colors.white : Colors.black12),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
