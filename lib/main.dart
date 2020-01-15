import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_flutter_showcase/screens/SamplesList.dart';
import 'package:my_flutter_showcase/screens/ScreenItem.dart';
import 'package:my_flutter_showcase/screens/animation_example/animation_examples.dart';
import 'package:my_flutter_showcase/screens/cards_app_design/cards_app_design_main.dart';
import 'package:my_flutter_showcase/screens/food_app_design/food_main.dart';
import 'package:my_flutter_showcase/screens/parallax_example/HomeSimpleParallax.dart';
import 'package:my_flutter_showcase/screens/plant_app_design/plant_app_design.dart';
import 'package:my_flutter_showcase/screens/sign_up_design/SugnUpDesignMain.dart';

import 'screens/MainComponents.dart' as mainComponents;
import 'screens/firewatch_parallax/firewatch_parallax_main.dart';

main(List<String> args) {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MainApp());
  });
}

// ! The lines above are just a test
class MainApp extends StatefulWidget with mainComponents.MainComponents {
  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      SystemChrome.setPreferredOrientations(
          [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SamplesList(
      itens: <ScreenItem>[
        ScreenItem(
            representationIcon: Icons.bubble_chart,
            title: "Food App Design",
            description: "Just a design",
            destination: MyFoodApp()),
        ScreenItem(
            representationIcon: Icons.nature,
            /*Ou o icone vintage */
            title: "Plant App Design",
            description: "Just a design",
            destination: PlantAppDesignHome()),
        ScreenItem(
            representationIcon: Icons.flip,
            title: "Simple Parallax",
            description: "Just a design",
            destination: HomeSimpleParallax()),
        ScreenItem(
            representationIcon: Icons.crop_landscape,
            title: "Cards App Design",
            description: "Just a design",
            destination: CardsAppDesignMain()),
        ScreenItem(
          representationIcon: Icons.ac_unit,
          title: "Animation Samples",
          description: "Samples of animations on Flutter",
          destination: AnimationExamplesMain(),
        ),
        ScreenItem(
          representationIcon: Icons.person,
          title: "Sign up design",
          description: "Sign up form smartphone design",
          destination: SignUpDesignMain(),
        ),
        ScreenItem(
          representationIcon: Icons.flip,
          title: "Firewatch Parallax Design",
          description: "A example of parallax effect in flutter",
          destination: FirewatchParallaxHome(),
        ),

      ],
    );
  }
}
