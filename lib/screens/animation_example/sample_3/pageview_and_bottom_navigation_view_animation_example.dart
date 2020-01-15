import 'package:flutter/material.dart';

class PageViewAndBottomNavigationViewAnimationExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      home: PagesAppAnimation(),
    );
  }
}

class PagesAppAnimation extends StatefulWidget {
  @override
  _PagesAppAnimationState createState() => _PagesAppAnimationState();
}

class _PagesAppAnimationState extends State<PagesAppAnimation> {
  PageController pageController;
  List<String> pageTitles = [
    'Home',
    'Feed',
    'Favorites',
    'Account',
    'Settings'
  ];

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: 0);

    // Capturing the double that represents the page scrool transition value
    pageController.addListener(() {
      print('pageControllerListener: ${pageController.page}');
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'PageView Animation',
        ),
        actions: <Widget>[
          IconButton(
              onPressed: () {
                pageController.previousPage(
                    duration: Duration(
                      milliseconds: 500,
                    ),
                    curve: Curves.easeInOutBack);
              },
              icon: Icon(Icons.arrow_back_ios)),
          IconButton(onPressed: () {}, icon: Icon(Icons.home)),
          IconButton(
              onPressed: () {
                pageController.nextPage(
                    duration: Duration(
                      milliseconds: 500,
                    ),
                    curve: Curves.easeInOutBack);
              },
              icon: Icon(Icons.arrow_forward_ios)),
        ],
      ),

      // PageView (in the body)
      body: PageView.builder(
        itemCount: pageTitles.length,
        controller: pageController,
        reverse: false,
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, page) {
          return Center(
            child: Text(
              pageTitles[page],
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).accentColor),
            ),
          );
        },
      ),

      // Bottom App Bar
      bottomNavigationBar: AnimatedBuilder(
        animation: pageController,
        builder: (BuildContext context, Widget child) {
          return BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: pageController.page.round(),
            onTap: (int page) {
              pageController.animateToPage(page,
                  curve: Curves.easeInOutBack,
                  duration: Duration(milliseconds: 500));
            },
            fixedColor: Theme.of(context).accentColor,
            backgroundColor: Theme.of(context).bottomAppBarColor,
            unselectedIconTheme:
                IconThemeData(color: Theme.of(context).disabledColor),
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home), title: Text(pageTitles[0])),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.rss_feed,
                  ),
                  title: Text(pageTitles[1])),
              BottomNavigationBarItem(
                  icon: Icon(Icons.star), title: Text(pageTitles[2])),
              BottomNavigationBarItem(
                  icon: Icon(Icons.account_circle), title: Text(pageTitles[3])),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings_applications),
                  title: Text(pageTitles[4])),
            ],
          );
        },
      ),
    );
  }
}
