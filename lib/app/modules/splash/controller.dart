import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashController extends GetxController with GetTickerProviderStateMixin {
  late Animation<double> scaleAnimation;
  late AnimationController scaleAnimationController;

  late Animation<double> fadeAnimationText;
  late Animation<Offset> alignAnimationText;
  late Animation<double> fadeAnimationButton;
  late Animation<Offset> alignAnimationButton;
  late AnimationController fadeAnimationController;

  @override
  void onInit() {
    const Duration scaleDuration = Duration(seconds: 2);
    const Duration fadeDuration = Duration(milliseconds: 800);

    fadeAnimationController =
        AnimationController(vsync: this, duration: fadeDuration);

    scaleAnimationController =
        AnimationController(vsync: this, duration: scaleDuration)
          ..forward().whenComplete(() {
            fadeAnimationController.forward();
            scaleAnimationController.reverse();
          });

    fadeAnimationText = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: fadeAnimationController,
        curve: const Interval(.2, 1, curve: Curves.ease),
      ),
    );
    alignAnimationText =
        Tween<Offset>(begin: const Offset(0.0, 0.05), end: Offset.zero).animate(
      CurvedAnimation(
        parent: fadeAnimationController,
        curve: const Interval(.2, 1, curve: Curves.ease),
      ),
    );
    fadeAnimationButton = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: fadeAnimationController,
        curve: const Interval(.8, 1, curve: Curves.ease),
      ),
    );
    alignAnimationButton =
        Tween<Offset>(begin: const Offset(0.0, 0.05), end: Offset.zero).animate(
      CurvedAnimation(
        parent: fadeAnimationController,
        curve: const Interval(.8, 1, curve: Curves.ease),
      ),
    );

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
