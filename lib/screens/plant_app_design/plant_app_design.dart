import 'package:flutter/material.dart';

main(List<String> args) {
  runApp(PlantAppDesignHome());
}

class PlantAppDesignHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: PlantAppDesignHomePage(),
      ),
    );
  }
}

class PlantAppDesignHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green[700],
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 3,
            child: Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.only(bottomLeft: Radius.circular(100)),
                color: Colors.white,
              ),
              child: PlantAppDesignDescriptionWidget(),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              width: double.infinity,
              height: 200,
              color: Colors.green[700],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  PlantAppDesignButton(),
                  PlantAppDesignButton(
                    mainTitle: "18",
                    mainTitleComplement: " ºC",
                    titleDescription: "Sunshine",
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class PlantAppDesignButton extends StatelessWidget {
  final double width;
  final double height;
  final String mainTitle;
  final String mainTitleComplement;
  final String titleDescription;

  const PlantAppDesignButton(
      {Key key,
      this.width = 150,
      this.height = 120,
      this.mainTitle = "250",
      this.mainTitleComplement = " ml",
      this.titleDescription = "water"})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      alignment: Alignment.bottomCenter,
      decoration: BoxDecoration(
          color: Colors.green[800],
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30))),
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  mainTitle,
                  style: TextStyle(
                      fontSize: 45,
                      fontWeight: FontWeight.w900,
                      color: Colors.white),
                ),
                Text(
                  titleDescription,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w300),
                )
              ],
            ),
            Text(
              mainTitleComplement,
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w300),
            )
          ],
        ),
      ),
    );
  }
}

class PlantAppDesignDescriptionWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 40),
      child: Builder(
        builder: (BuildContext context) {
          return Stack(
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 40, bottom: 25),
                    child: Icon(Icons.arrow_back),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Fiddle Leaf Fig \nTopiary",
                          style: TextStyle(
                              fontSize: 45, fontWeight: FontWeight.w800),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 18),
                          child: Text(
                            "10\" Nursery Pot",
                            style: TextStyle(fontWeight: FontWeight.w300),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: Text(
                            "\$85",
                            style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.w900,
                                color: Colors.green[700]),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        // floating button
                      ],
                    ),
                  )
                ],
              ),
              Align(
                alignment: Alignment(1, 1),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Container(
                    // color: Colors.amber,
                    height: 400,
                    child: Image.asset(
                        "assets/images/plant_app_design/planta.jpg"),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 30, right: 80),
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                        color: Colors.green[700],
                        borderRadius: BorderRadius.circular(50)),
                    child: Icon(
                      Icons.shopping_cart,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
