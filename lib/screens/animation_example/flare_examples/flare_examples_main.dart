import 'package:flutter/material.dart';
import 'package:my_flutter_showcase/screens/SamplesList.dart';
import 'package:my_flutter_showcase/screens/ScreenItem.dart';
import 'package:my_flutter_showcase/screens/animation_example/flare_examples/flare_example1/flare_android_logo_animation.dart';
import 'package:my_flutter_showcase/screens/animation_example/flare_examples/flare_example2/flare_check_button_animation.dart';

import 'flare_example3/loading_animation_example.dart';

class FlareExamplesMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SamplesList(
      itens: <ScreenItem>[
        ScreenItem(
          representationIcon: Icons.android,
          title: 'Android animation',
          description: 'A flare animation with android logo',
          destination: FlareAndroidLogoAnim(),
        ),
        ScreenItem(
          representationIcon: Icons.android,
          title: 'Check Button Animation',
          description: 'A button animation with flare',
          destination: CheckButtonFlareAnim(),
        ),
        ScreenItem(
          representationIcon: Icons.autorenew,
          title: 'Flare ball drop loading animation example',
          description: 'Example of Flare loading animation',
          destination: FlareBallDropLoadingAnimation(),
        ),
      ],
    );
  }
}
