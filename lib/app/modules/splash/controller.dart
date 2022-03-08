import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashController extends GetxController with GetTickerProviderStateMixin {
  late Animation<double> scaleAnimation;
  late AnimationController scaleAnimationController;

  late Animation<double> fadeAnimation;
  late AnimationController fadeAnimationController;

  @override
  void onInit() {
    const Duration scaleDuration = Duration(seconds: 2);
    const Duration fadeDuration = Duration(seconds: 1);

    fadeAnimationController =
        AnimationController(vsync: this, duration: fadeDuration);

    scaleAnimationController =
        AnimationController(vsync: this, duration: scaleDuration)
          ..forward().whenComplete(() {
            fadeAnimationController.forward();
            scaleAnimationController.reverse();
          });

    fadeAnimation =
        Tween<double>(begin: 0, end: 1).animate(fadeAnimationController);

    scaleAnimation =
        Tween<double>(begin: 1.1, end: 1).animate(scaleAnimationController);
    super.onInit();
  }

  @override
  void onClose() {
    scaleAnimationController.dispose();
    fadeAnimationController.dispose();
    super.onClose();
  }
}
