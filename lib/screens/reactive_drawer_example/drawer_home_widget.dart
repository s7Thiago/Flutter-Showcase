import 'package:flutter/material.dart';
import 'package:my_flutter_showcase/screens/reactive_drawer_example/custom_drawer.dart';
import 'package:my_flutter_showcase/screens/reactive_drawer_example/drawer_pages/drawer_account_page.dart';
import 'package:my_flutter_showcase/screens/reactive_drawer_example/drawer_pages/drawer_favorites_page.dart';
import 'package:my_flutter_showcase/screens/reactive_drawer_example/drawer_pages/drawer_home_page.dart';

class ReactiveDrawerHomeWidget extends StatefulWidget {
  @override
  _ReactiveDrawerHomeWidgetState createState() =>
      _ReactiveDrawerHomeWidgetState();
}

class _ReactiveDrawerHomeWidgetState extends State<ReactiveDrawerHomeWidget> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  var pages = <Widget>[
    DrawerHomePage(),
    DrawerFavoritesPage(),
    DrawerAccountPage(),
  ];

  PageController drawerPageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          title: Text('Navegação'),
        ),
        drawer: CustomDrawer(
          onPressed: (index) {
            scaffoldKey.currentState.openEndDrawer();
            drawerPageController.jumpToPage(index);
          },
          pageController: drawerPageController,
        ),
        body: PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: drawerPageController,
          children: pages,
        ));
  }
}
