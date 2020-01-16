import 'package:flutter/material.dart';
import 'dart:math';

import 'package:swipedetector/swipedetector.dart';

class PageAnimation extends StatefulWidget {
  @override
  _PageAnimationState createState() => _PageAnimationState();
}

class _PageAnimationState extends State<PageAnimation> {
  final PageController _controller =
      PageController(initialPage: 0, viewportFraction: 0.8);
  int currentPage = 0;
  String activeTag = 'Favorites';
  bool colorMode = true;
  List<String> pages = [
    'Home',
    'Stories',
    'Favorites',
    'Settings',
    'Profile',
    'Account',
    'Search'
  ];

  List<String> images = [
    'http://www.golfenvironmenteurope.org/wp-content/uploads/2019/11/earth-desktop-wallpapers-top-free-samsung-wallpaper-awesome-1.jpg',
    'https://i.imgur.com/u4sB9yl.jpg',
    'https://www.jpl.nasa.gov/spaceimages/images/wallpaper/PIA15985-1280x800.jpg',
    'https://eblanchardblog.files.wordpress.com/2015/08/milky-way-galaxy.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSM5uAWzJPcuBRNL-1ncWfFmzm5LyFwUqdJW5q8dpWwdiIOaUPn&s',
    'https://static.vecteezy.com/system/resources/previews/000/208/954/non_2x/vector-abstract-landscape-illustration.jpg',
    'https://i.pinimg.com/originals/31/9d/ce/319dce67ea7e656296d9334040a9b991.jpg',
    'https://www.itl.cat/pngfile/big/1-11701_1080p-wallpapers-cool-desktop-backgrounds-space.jpg',
    'https://static.vecteezy.com/system/resources/previews/000/456/299/non_2x/cartoon-night-landscape-comet-moon-mountains-illustration-vector.jpg',
  ];
  List<Color> colors = [
    Colors.amber,
    Colors.blueGrey,
    Colors.greenAccent,
    Colors.orangeAccent,
    Colors.black,
    Colors.black54,
    Colors.red,
    Colors.brown,
  ];

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      int next = _controller.page.round();
      if (currentPage != next) {
        setState(() {
          currentPage = next;
        });
      }
    });
  }

  Widget _buildPage(List<String> pages, int index, bool active) {
// Animation proprieties:
    final double blur = active ? 30 : 0;
    final double offSet = active ? 20 : 0;
    final double top = active ? 100 : 200;

    Widget _buildAnimatedCard(bool mode, List<String> images) {
      return mode
          ? AnimatedContainer(
              duration: Duration(milliseconds: 700),
              curve: Curves.easeInOutQuint,
              margin: EdgeInsets.only(top: top, bottom: 50, right: 30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: colors[Random().nextInt(colors.length)],
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.black87,
                    blurRadius: blur,
                    offset: Offset(offSet, offSet),
                  ),
                ],
              ),
              child: Center(
                  child: Text(
                pages[index],
                style: TextStyle(color: Colors.white, fontSize: 40),
              )),
            )
          : AnimatedContainer(
              duration: Duration(milliseconds: 1000),
              curve: Curves.easeInOutQuint,
              margin: EdgeInsets.only(top: top, bottom: 600, right: 30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: colors[Random().nextInt(colors.length)],
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.black87,
                    blurRadius: blur,
                    offset: Offset(offSet, offSet),
                  ),
                ],
                image: DecorationImage(
                    image: NetworkImage(
                      images[index],
                    ),
                    fit: BoxFit.cover),
              ),
              child: Center(
                  child: Text(
                pages[index],
                style: TextStyle(color: Colors.white, fontSize: 40),
              )),
            );
    }

    return _buildAnimatedCard(colorMode, images);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      debugShowCheckedModeBanner: true,
      home: Scaffold(
        body: PageView.builder(
          controller: _controller,
          itemCount: pages.length,
          itemBuilder: (context, index) {
            bool active = index == currentPage;

            return Column(
              children: <Widget>[
                Expanded(child: _buildPage(pages, index, active)),
              ],
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              colorMode = !colorMode;
            });
          },
          child: Icon(Icons.change_history),
          elevation: colorMode ? 15 : 0,
          mini: false,
          focusColor: Colors.white,
          highlightElevation: 5,
          hoverElevation: 8,
          isExtended: true,
          focusElevation: 15,
        ),
      ),
    );
  }
}
