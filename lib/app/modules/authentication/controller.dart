import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthenticationController extends GetxController
    with GetTickerProviderStateMixin {
  late Animation<double> titleAnimation;
  late Animation<double> imageAnimation;
  late Animation<double> descriptionAnimation;
  late Animation<double> registerBtnAnimation;
  late Animation<double> loginBtnAnimation;
  late Animation<double> termsAnimation;
  late AnimationController fadeAnimationController;

  @override
  void onInit() {
    const duration = Duration(seconds: 1);
    fadeAnimationController =
        AnimationController(vsync: this, duration: duration)..forward();

    titleAnimation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
      parent: fadeAnimationController,
      curve: const Interval(0.0, 0.16, curve: Curves.easeInExpo),
    ));
    imageAnimation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
      parent: fadeAnimationController,
      curve: const Interval(0.16, 0.32, curve: Curves.easeInExpo),
    ));
    descriptionAnimation =
        Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
      parent: fadeAnimationController,
      curve: const Interval(0.32, 0.48, curve: Curves.easeInExpo),
    ));
    registerBtnAnimation =
        Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
      parent: fadeAnimationController,
      curve: const Interval(0.48, 0.64, curve: Curves.easeInExpo),
    ));
    loginBtnAnimation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
      parent: fadeAnimationController,
      curve: const Interval(0.64, 0.80, curve: Curves.easeInExpo),
    ));
    termsAnimation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
      parent: fadeAnimationController,
      curve: const Interval(0.80, 0.96, curve: Curves.easeInExpo),
    ));
    super.onInit();
  }

  @override
  void onClose() {
    fadeAnimationController.dispose();
    super.onClose();
  }
}
