import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter_showcase/screens/cards_app_design/BottomBar.dart';
import 'package:my_flutter_showcase/screens/cards_app_design/CircleIcButton.dart';
import 'package:my_flutter_showcase/screens/cards_app_design/Dot.dart';
import 'package:my_flutter_showcase/screens/cards_app_design/MyCard.dart';
import 'package:my_flutter_showcase/screens/cards_app_design/Space.dart';

// ignore: must_be_immutable
class CardsAppDesignHomePage extends StatelessWidget {
  double dotSize = 6;
  double spaceHeight = 7;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(color: Colors.blue),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "SWIPE",
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      letterSpacing: 2,
                      fontSize: 16),
                ),
                Text(
                  " LONG",
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.black38,
                      letterSpacing: 2,
                      fontSize: 16),
                )
              ],
            ),
          ),
          Stack(
            alignment: Alignment.bottomCenter,
            children: <Widget>[
              MyCard(
                width: 265,
                height: 434,
                color: Color(0x55ffffff),
                activateShadow: false,
              ),
              MyCard(
                width: 290,
                height: 427,
                color: Color(0xaaffffff),
                activateShadow: false,
              ),
              MyCard(
                  width: 315,
                  height: 420,
                  borderRadius: 15,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Expanded(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 12),
                          child: Container(
                            // color: Colors.amberAccent,
                            width: double.infinity,
                            alignment: Alignment.centerRight,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Space(
                                  height: spaceHeight,
                                ),
                                Dot(
                                  width: dotSize,
                                  height: dotSize,
                                ),
                                Space(
                                  height: spaceHeight,
                                ),
                                Dot(
                                  color: Colors.blue,
                                  width: dotSize,
                                  height: dotSize,
                                ),
                                Space(
                                  height: spaceHeight,
                                ),
                                Dot(
                                  // color: Colors.lime,
                                  width: dotSize,
                                  height: dotSize,
                                ),
                                Space(
                                  height: spaceHeight,
                                ),
                                Dot(
                                  width: dotSize,
                                  height: dotSize,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 10,
                        child: Container(
                          width: double.infinity,
                          // color: Colors.amber[200],
                          alignment: Alignment.topCenter,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Image.asset(
                                "assets/images/cards_app_design/cards_app_design_google_logo.png",
                                height: 160,
                                width: 160,
                              ),
                              Space(
                                height: 5,
                              ),
                              Text(
                                "GOOGL",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 5,
                                    color: Colors.black54),
                              ),
                              Space(
                                height: 5,
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  )),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Space(
                width: 20,
              ),
              CircleIcButton(
                buttonRadius: 60,
                color: Colors.white,
                iconColor: Colors.blue,
                icon: Icons.clear,
              ),
              CircleIcButton(
                buttonRadius: 60,
                color: Colors.white,
                iconColor: Colors.green,
                icon: Icons.check,
              ),
              Space(
                width: 20,
              ),
            ],
          ),
          BottomBar(
            backgroundColor: Colors.transparent,
            itens: <Icon>[
              Icon(
                Icons.all_inclusive,
                color: Colors.white,
              ),
              Icon(
                Icons.check_circle_outline,
                color: Colors.black38,
              ),
              Icon(
                Icons.person_outline,
                color: Colors.black38,
              ),
              Icon(
                Icons.chat_bubble_outline,
                color: Colors.black38,
              ),
            ],
          )
        ],
      ),
    );
  }
}
