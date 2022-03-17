import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BarberProfileController extends GetxController
    with GetTickerProviderStateMixin {
  late AnimationController animationController;

  late Animation<double> fadeLikeButtonAnimation;
  late Animation<Offset> slideLikeButtonAnimation;
  late Animation<double> fadeDescriptionAnimation;
  late Animation<Offset> slideDescriptionAnimation;
  late Animation<double> fadeBookButtonAnimation;
  late Animation<Offset> slideBookButtonAnimation;

  @override
  void onInit() {
    const duration = Duration(milliseconds: 600);
    const beginOffset = Offset(0, .6);

    animationController = AnimationController(vsync: this, duration: duration)
      ..forward();
    slideLikeButtonAnimation =
        Tween<Offset>(begin: beginOffset, end: Offset.zero).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(.13, 1, curve: Curves.ease),
      ),
    );
    fadeLikeButtonAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(.13, 1, curve: Curves.ease),
      ),
    );
    slideDescriptionAnimation =
        Tween<Offset>(begin: beginOffset, end: Offset.zero).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(.46, 1, curve: Curves.ease),
      ),
    );
    fadeDescriptionAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(.46, 1, curve: Curves.ease),
      ),
    );
    slideBookButtonAnimation =
        Tween<Offset>(begin: beginOffset, end: Offset.zero).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(.59, 1, curve: Curves.ease),
      ),
    );
    fadeBookButtonAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(.59, 1, curve: Curves.ease),
      ),
    );

    super.onInit();
  }

  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }
}
