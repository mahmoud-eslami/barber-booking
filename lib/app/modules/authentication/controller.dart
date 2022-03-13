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
  late Animation<Offset> titleSlideAnimation;
  late Animation<Offset> imageSlideAnimation;
  late Animation<Offset> descriptionSlideAnimation;
  late Animation<Offset> registerBtnSlideAnimation;
  late Animation<Offset> loginBtnSlideAnimation;
  late Animation<Offset> termsSlideAnimation;
  late AnimationController fadeAnimationController;

  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  void onInit() {
    emailController = TextEditingController();
    passwordController = TextEditingController();

    const duration = Duration(milliseconds: 600);
    const startOffset = Offset(0.0, .2);
    const endOffset = Offset.zero;
    fadeAnimationController =
        AnimationController(vsync: this, duration: duration)..forward();

    titleAnimation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
      parent: fadeAnimationController,
      curve: const Interval(0.2, 1, curve: Curves.easeInExpo),
    ));
    titleSlideAnimation = Tween<Offset>(begin: startOffset, end: endOffset)
        .animate(CurvedAnimation(
      parent: fadeAnimationController,
      curve: const Interval(0.2, 1, curve: Curves.ease),
    ));
    imageAnimation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
      parent: fadeAnimationController,
      curve: const Interval(0.4, 1, curve: Curves.ease),
    ));
    imageSlideAnimation = Tween<Offset>(begin: startOffset, end: endOffset)
        .animate(CurvedAnimation(
      parent: fadeAnimationController,
      curve: const Interval(0.4, 1, curve: Curves.ease),
    ));
    descriptionAnimation =
        Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
      parent: fadeAnimationController,
      curve: const Interval(0.6, 1, curve: Curves.ease),
    ));
    descriptionSlideAnimation =
        Tween<Offset>(begin: startOffset, end: endOffset)
            .animate(CurvedAnimation(
      parent: fadeAnimationController,
      curve: const Interval(0.6, 1, curve: Curves.ease),
    ));
    registerBtnAnimation =
        Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
      parent: fadeAnimationController,
      curve: const Interval(0.7, 1, curve: Curves.ease),
    ));
    registerBtnSlideAnimation =
        Tween<Offset>(begin: startOffset, end: endOffset)
            .animate(CurvedAnimation(
      parent: fadeAnimationController,
      curve: const Interval(0.7, 1, curve: Curves.ease),
    ));
    loginBtnAnimation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
      parent: fadeAnimationController,
      curve: const Interval(0.8, 1, curve: Curves.ease),
    ));
    loginBtnSlideAnimation = Tween<Offset>(begin: startOffset, end: endOffset)
        .animate(CurvedAnimation(
      parent: fadeAnimationController,
      curve: const Interval(0.8, 1, curve: Curves.ease),
    ));
    termsAnimation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
      parent: fadeAnimationController,
      curve: const Interval(0.9, 1, curve: Curves.ease),
    ));
    termsSlideAnimation = Tween<Offset>(begin: startOffset, end: endOffset)
        .animate(CurvedAnimation(
      parent: fadeAnimationController,
      curve: const Interval(0.9, 1, curve: Curves.ease),
    ));
    super.onInit();
  }

  @override
  void onClose() {
    fadeAnimationController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
