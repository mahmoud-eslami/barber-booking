import 'package:barber_booking/app/data/enums/splash_state.dart';
import 'package:barber_booking/app/data/services/firebase_service.dart';
import 'package:barber_booking/app/global_widgets/global_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../exports.dart';

class SplashController extends GetxController with GetTickerProviderStateMixin {
  final FirebaseService _firebaseService = Get.find();
  final Routes _routes = Get.find();

  late Animation<double> scaleAnimation;
  late AnimationController scaleAnimationController;

  late Animation<double> fadeAnimationText;
  late Animation<Offset> alignAnimationText;
  late Animation<double> fadeAnimationButton;
  late Animation<Offset> alignAnimationButton;
  late AnimationController fadeAnimationController;

  Rx<SplashState> pageState = SplashState.initial.obs;

  @override
  void onClose() {
    disposeAnimations();
    super.onClose();
  }

  @override
  void onInit() {
    initilizedAnimations();
    super.onInit();
  }

  void checkUserAuthentication() async {
    try {
      bool authState = await _firebaseService.checkUserState();

      if (authState) {
        Get.offAndToNamed(_routes.homeRoute);
      } else {
        Get.offAndToNamed(_routes.authRoute);
      }
    } catch (e) {
      globalSnackbar(content: e.toString());
    }
  }

  void disposeAnimations() {
    scaleAnimationController.dispose();
    fadeAnimationController.dispose();
  }

  void initilizedAnimations() {
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
  }
}
