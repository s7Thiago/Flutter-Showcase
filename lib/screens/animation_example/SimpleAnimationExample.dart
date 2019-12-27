import 'package:flutter/material.dart';
import 'package:my_flutter_showcase/screens/SamplesList.dart';
import 'package:my_flutter_showcase/screens/ScreenItem.dart';
import 'package:my_flutter_showcase/screens/animation_example/sample_1/AnimationExample1.dart';
import 'package:my_flutter_showcase/screens/animation_example/sample_2/AnimationExample2.dart';

class SimpleAnimationExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SamplesList(
      listTitle: "Animations Samples",
      itens: <Widget>[
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
      ],
    );
  }
}
