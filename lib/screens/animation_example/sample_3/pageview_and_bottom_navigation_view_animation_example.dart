import 'package:flutter/material.dart';

class PageViewAndBottomNavigationViewAnimationExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: PageViewAndBottomNavigationViewAnimationExampleHome(),
    );
  }
}

class PageViewAndBottomNavigationViewAnimationExampleHome
    extends StatefulWidget {
  @override
  _PageViewAndBottomNavigationViewAnimationExampleHomeState createState() =>
      _PageViewAndBottomNavigationViewAnimationExampleHomeState();
}

class _PageViewAndBottomNavigationViewAnimationExampleHomeState
    extends State<PageViewAndBottomNavigationViewAnimationExampleHome> {
  var pages = [
    'Home',
    'Favorites',
    'Account',
  ];
  PageController pageController;
  Color appBarColor = Colors.red;
  Color bodyColor = Color(0xffEF6F6C);
  Color bottomNavigationBarColor = Colors.red;
  Color pageTextColor = Colors.white;
  Color appBarTitleColor = Colors.white;
  Color iconsColor = Color(0xff700548);
  Color iconsTextColor = Colors.black;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

//    Adicionando um listener para pegar o valor double para a atual pagina
  pageController.addListener(() {
    print('pageListener: ${pageController.page.round()}');
  });

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'PageView',
          style: TextStyle(color: appBarTitleColor),
        ),
        backgroundColor: appBarColor,
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: iconsColor,
              ),
              onPressed: () {
                pageController.previousPage(
                    duration: Duration(milliseconds: 500),
                    curve: Curves.easeInOutBack);
              }),
          IconButton(
            focusColor: Colors.black,
            icon: Icon(Icons.home),
            color: iconsColor,
            onPressed: () {
            pageController.jumpToPage(0);
            },
          ),
          IconButton(
              icon: Icon(Icons.arrow_forward_ios, color: iconsColor),
              onPressed: () {
                pageController.nextPage(
                    duration: Duration(milliseconds: 500),
                    curve: Curves.easeInOutBack);
              }),
        ],
      ),
      body: Container(
        color: bodyColor,
        child: PageView.builder(
            controller: pageController,
            physics: ClampingScrollPhysics(),
            onPageChanged: (value) {
//              print('OnPageChanged: $value');
            },
            itemCount: pages.length,
            itemBuilder: (BuildContext context, int index) {
              return Center(
                  child: Text(
                pages[index],
                style: TextStyle(color: pageTextColor),
              ));
            }),
      ),
      bottomNavigationBar: AnimatedBuilder(
        animation: pageController,
        builder: (BuildContext context, Widget child) {
          return BottomNavigationBar(
            backgroundColor: bottomNavigationBarColor,
            onTap: (page){
              pageController.animateToPage(page, duration: Duration(milliseconds: 500), curve: Curves.easeInOutBack);
            },
            currentIndex: pageController.page.round(),
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: Icon(Icons.home, color: iconsColor),
                  title: Text(
                    'Home',
                    style: TextStyle(color: iconsTextColor),
                  )),
              BottomNavigationBarItem(
                  icon: Icon(Icons.star, color: iconsColor),
                  title:
                  Text('Favorites', style: TextStyle(color: iconsTextColor))),
              BottomNavigationBarItem(
                  icon: Icon(Icons.account_circle, color: iconsColor),
                  title: Text('Account', style: TextStyle(color: iconsTextColor)))
            ],
          );
        },
      ),
    );
  }
}
