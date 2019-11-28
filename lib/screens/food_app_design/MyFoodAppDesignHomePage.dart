import 'package:flutter/material.dart';

import 'FoodAppDesignBoxImage.dart';
import 'FoodAppDesignCategoriesBar.dart';
import 'FoodAppDesignBoxImageSearchBar.dart';

class MyFoodAppDesignHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: FoodAppDesignBoxImage(),
          ),
          FoodAppDesignBoxImageSearchBar(),
          Align(
              heightFactor: 2.5,
              alignment: Alignment.centerLeft,
              child: Text(
                "Choose today's dishes",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
              )),
          FoodAppDesignCategoriesBar(
            itens: [
              CategoriesBarItem(),
              CategoriesBarItem(),
              CategoriesBarItem(),
              CategoriesBarItem(),
              CategoriesBarItem(),
              CategoriesBarItem(),
              CategoriesBarItem(),
              CategoriesBarItem(),
              CategoriesBarItem(),
              CategoriesBarItem(),
              CategoriesBarItem(),
            ],
          ),
        ],
      ),
    );
  }
}
