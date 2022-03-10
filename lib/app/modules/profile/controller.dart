import 'package:flutter/animation.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController
    with GetTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> avatarAnimation;
  late Animation<double> fieldAnimation1;
  late Animation<double> fieldAnimation2;
  late Animation<double> fieldAnimation3;
  late Animation<double> buttonAnimation;

  @override
  void onInit() {
    const duration = Duration(milliseconds: 600);
    animationController = AnimationController(vsync: this, duration: duration)
      ..forward();
    avatarAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(.0, .20, curve: Curves.ease),
      ),
    );
    fieldAnimation1 = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(.20, .40, curve: Curves.ease),
      ),
    );
    fieldAnimation2 = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(.40, .60, curve: Curves.ease),
      ),
    );
    fieldAnimation3 = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(.60, .80, curve: Curves.ease),
      ),
    );
    buttonAnimation = Tween<double>(begin: 0, end: 1).animate(
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
