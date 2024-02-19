import 'package:flutter/material.dart';
import 'package:project2/src/view/widgets/background_img/background_image.dart';

import '../../screen/login/login_screen.dart';

class MixinBackgroundImage extends StatelessWidget {
  const MixinBackgroundImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackgroundImage(),
        LoginScreen(),
      ],
    );
  }
}
