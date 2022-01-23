import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renner_coatings/app/core/global_widgets/color_gradient_screen.dart';
import 'package:renner_coatings/app/modules/splash/splash_controller.dart';

class SplashPage extends GetView<SplashController> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ColorGradientScreen(),
        Center(
          child: Image.asset(
            'assets/images/logo_renner.png',
            width: 197,
            height: 51,
          ),
        ),
      ],
    );
  }
}
