import 'package:barber_booking/app/data/model/user/user_extra_info.dart';
import 'package:barber_booking/app/data/services/firebase_service.dart';
import 'package:barber_booking/app/global_widgets/global_snackbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../exports.dart';

class ProfileController extends GetxController
    with GetTickerProviderStateMixin {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController ageController = TextEditingController();

  final Routes _routes = Get.find();

  double pixelHolder = 0.0;

  RxInt gender = 3.obs;

  late AnimationController animationController;
  late Animation<Offset> avatarAnimation;
  late Animation<double> avatarFadeAnimation;
  late Animation<Offset> fieldAnimation1;
  late Animation<double> fieldFadeAnimation1;
  late Animation<Offset> fieldAnimation2;
  late Animation<double> fieldFadeAnimation2;
  late Animation<Offset> emailFieldSlideAnimation;
  late Animation<double> emailFieldFadeAnimation;
  late Animation<Offset> genderSelectorAnimation;
  late Animation<double> genderSelectorFadeAnimation;
  late Animation<Offset> ageFieldAnimation;
  late Animation<double> ageFieldFadeAnimation;
  late Animation<Offset> buttonAnimation;
  late Animation<double> buttonFadeAnimation;

  final FirebaseService _firebaseService = Get.find();

  @override
  void onInit() {
    initializeAnimations();
    getDisplayName();
    getUserEmail();
    getUserExtraInfo();
    super.onInit();
  }

  @override
  void onClose() {
    animationController.dispose();
    emailController.dispose();
    nameController.dispose();
    ageController.dispose();
    super.onClose();
  }

  logout() async {
    await _firebaseService.logout();
    Get.offAllNamed(_routes.authRoute);
  }

  void getUserEmail() =>
      emailController.text = _firebaseService.getUser()?.email ?? "";

  String getPhotoUrl() => _firebaseService.getUser()?.photoURL ?? "";

  void getDisplayName() =>
      nameController.text = _firebaseService.getUser()?.displayName ?? "";

  void getUserExtraInfo() async {
    try {
      UserExtraInfo? userInfo = await _firebaseService.getUserExtraInfo();
      if (userInfo != null) {
        ageController.text = userInfo.age.toString();
        gender(userInfo.gender);
      }
    } catch (e) {
      globalSnackbar(content: e.toString());
    }
  }

  void updateProfile({email, name, photoUrl}) async {
    try {
      bool status = await _firebaseService.updateUserBaseInfo(
          email: email, name: name, photo: photoUrl);
      bool extraStatus = await _firebaseService.updateUserExtraInfo(
          age: int.parse(ageController.text), gender: gender.value);
      if (status || extraStatus) {
        Get.back();
      } else {
        globalSnackbar(content: "Failed please try again!");
      }
    } catch (e) {
      globalSnackbar(content: e.toString());
    }
  }

  setManAsGender() => gender(1);

  setWomanAsGender() => gender(0);

  initializeAnimations() {
    const duration = Duration(milliseconds: 800);
    const beginOffset = Offset(0, .6);
    animationController = AnimationController(vsync: this, duration: duration)
      ..forward();
    avatarAnimation =
        Tween<Offset>(begin: beginOffset, end: Offset.zero).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(.13, 1, curve: Curves.ease),
      ),
    );
    avatarFadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(.13, 1, curve: Curves.ease),
      ),
    );
    fieldAnimation1 =
        Tween<Offset>(begin: beginOffset, end: Offset.zero).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(.33, 1, curve: Curves.ease),
      ),
    );
    fieldFadeAnimation1 = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(.33, 1, curve: Curves.ease),
      ),
    );
    fieldAnimation2 =
        Tween<Offset>(begin: beginOffset, end: Offset.zero).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(.46, 1, curve: Curves.ease),
      ),
    );
    fieldFadeAnimation2 = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(.46, 1, curve: Curves.ease),
      ),
    );
    emailFieldSlideAnimation =
        Tween<Offset>(begin: beginOffset, end: Offset.zero).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(.52, 1, curve: Curves.ease),
      ),
    );
    emailFieldFadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(.52, 1, curve: Curves.ease),
      ),
    );
    ageFieldAnimation =
        Tween<Offset>(begin: beginOffset, end: Offset.zero).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(.59, 1, curve: Curves.ease),
      ),
    );
    ageFieldFadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(.59, 1, curve: Curves.ease),
      ),
    );

    genderSelectorAnimation =
        Tween<Offset>(begin: beginOffset, end: Offset.zero).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(.72, 1, curve: Curves.ease),
      ),
    );
    genderSelectorFadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(.72, 1, curve: Curves.ease),
      ),
    );
    buttonAnimation =
        Tween<Offset>(begin: beginOffset, end: Offset.zero).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(.85, 1, curve: Curves.ease),
      ),
    );
    buttonFadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(.85, 1, curve: Curves.ease),
      ),
    );
  }
}
