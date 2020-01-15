import 'package:flutter/material.dart';
import 'package:my_flutter_showcase/screens/SamplesList.dart';
import 'package:my_flutter_showcase/screens/ScreenItem.dart';
import 'package:my_flutter_showcase/screens/animation_example/sample_1/AnimationExample1.dart';
import 'package:my_flutter_showcase/screens/animation_example/sample_2/AnimationExample2.dart';
import 'package:my_flutter_showcase/screens/animation_example/sample_3/pageview_and_bottom_navigation_view_animation_example.dart';

import 'flare_examples/flare_examples_main.dart';

class AnimationExamplesMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SamplesList(
      listTitle: "Animations Samples",
      itens: <ScreenItem>[
        ScreenItem(
          representationIcon: Icons.ac_unit,
          title: 'Sample 1',
          description:
              'A simple animation example with AnimatedContainer and CrossFade',
          destination: AnimationExample1(),
        ),
        ScreenItem(
          representationIcon: Icons.ac_unit,
          title: 'Sample 2',
          description: 'A simple animation example using controller',
          destination: AnimationExample2(),
        ),
        ScreenItem(
          representationIcon: Icons.clear_all,
          title: 'Flare Samples',
          description: 'Examples of Flare animation usage',
          destination: FlareExamplesMain(),
        ),
        ScreenItem(
          representationIcon: Icons.chrome_reader_mode,
          title: 'PageView and Bottom navigation view',
          description: 'Examples of integration between the animation controllers on PageView and Bottom Navigation View',
          destination: PageViewAndBottomNavigationViewAnimationExample(),
        ),
      ],
    );
  }
}
