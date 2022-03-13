import 'dart:ui';

import 'package:flutter/animation.dart';
import 'package:get/get.dart';

class NewsController extends GetxController with GetTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> storyLineFadeAnimation;
  late Animation<Offset> storyLineSlideAnimation;
  late Animation<double> newsTitleFadeAnimation;
  late Animation<Offset> newsTitleSlideAnimation;
  late Animation<double> newsLineFadeAnimation;
  late Animation<Offset> newsLineSlideAnimation;
  late Animation<double> trendTitleFadeAnimation;
  late Animation<Offset> trendTitleSlideAnimation;
  late Animation<double> trendLineFadeAnimation;
  late Animation<Offset> trendLineSlideAnimation;

  @override
  void onInit() {
    const duration = Duration(milliseconds: 600);
    const startOffset = Offset(0.0, .2);
    const endOffset = Offset.zero;
    animationController = AnimationController(
      vsync: this,
      duration: duration,
    )..forward();

    storyLineFadeAnimation =
        Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
      parent: animationController,
      curve: const Interval(0.5, 1, curve: Curves.easeInExpo),
    ));
    storyLineSlideAnimation = Tween<Offset>(begin: startOffset, end: endOffset)
        .animate(CurvedAnimation(
      parent: animationController,
      curve: const Interval(0.5, 1, curve: Curves.ease),
    ));
    newsTitleFadeAnimation =
        Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
      parent: animationController,
      curve: const Interval(0.6, 1, curve: Curves.ease),
    ));
    newsTitleSlideAnimation = Tween<Offset>(begin: startOffset, end: endOffset)
        .animate(CurvedAnimation(
      parent: animationController,
      curve: const Interval(0.6, 1, curve: Curves.ease),
    ));
    newsLineFadeAnimation =
        Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
      parent: animationController,
      curve: const Interval(0.6, 1, curve: Curves.ease),
    ));
    newsLineSlideAnimation = Tween<Offset>(begin: startOffset, end: endOffset)
        .animate(CurvedAnimation(
      parent: animationController,
      curve: const Interval(0.6, 1, curve: Curves.ease),
    ));
    trendTitleFadeAnimation =
        Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
      parent: animationController,
      curve: const Interval(0.7, 1, curve: Curves.ease),
    ));
    trendTitleSlideAnimation = Tween<Offset>(begin: startOffset, end: endOffset)
        .animate(CurvedAnimation(
      parent: animationController,
      curve: const Interval(0.7, 1, curve: Curves.ease),
    ));
    trendLineFadeAnimation =
        Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
      parent: animationController,
      curve: const Interval(0.8, 1, curve: Curves.ease),
    ));
    trendLineSlideAnimation = Tween<Offset>(begin: startOffset, end: endOffset)
        .animate(CurvedAnimation(
      parent: animationController,
      curve: const Interval(0.8, 1, curve: Curves.ease),
    ));

    super.onInit();
  }

  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }
}
