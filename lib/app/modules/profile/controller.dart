import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController
    with GetTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> avatarAnimation;
  late Animation<double> avatarFadeAnimation;
  late Animation<Offset> fieldAnimation1;
  late Animation<double> fieldFadeAnimation1;
  late Animation<Offset> fieldAnimation2;
  late Animation<double> fieldFadeAnimation2;
  late Animation<Offset> fieldAnimation3;
  late Animation<double> fieldFadeAnimation3;
  late Animation<Offset> buttonAnimation;
  late Animation<double> buttonFadeAnimation;

  @override
  void onInit() {
    const duration = Duration(milliseconds: 800);
    const beginOffset = Offset(0, 2);
    animationController = AnimationController(vsync: this, duration: duration)
      ..forward();
    avatarAnimation =
        Tween<Offset>(begin: beginOffset, end: Offset.zero).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(.0, 1, curve: Curves.ease),
      ),
    );
    avatarFadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(.0, 1, curve: Curves.ease),
      ),
    );
    fieldAnimation1 =
        Tween<Offset>(begin: beginOffset, end: Offset.zero).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(.20, 1, curve: Curves.ease),
      ),
    );
    fieldFadeAnimation1 = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(.20, 1, curve: Curves.ease),
      ),
    );
    fieldAnimation2 =
        Tween<Offset>(begin: beginOffset, end: Offset.zero).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(.40, 1, curve: Curves.ease),
      ),
    );
    fieldFadeAnimation2 = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(.40, 1, curve: Curves.ease),
      ),
    );
    fieldAnimation3 =
        Tween<Offset>(begin: beginOffset, end: Offset.zero).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(.60, 1, curve: Curves.ease),
      ),
    );
    fieldFadeAnimation3 = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(.60, 1, curve: Curves.ease),
      ),
    );
    buttonAnimation =
        Tween<Offset>(begin: beginOffset, end: Offset.zero).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(.80, 1, curve: Curves.ease),
      ),
    );
    buttonFadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(.80, 1, curve: Curves.ease),
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
