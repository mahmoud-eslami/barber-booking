import 'package:barber_booking/app/data/services/firebase_service.dart';
import 'package:barber_booking/app/global_widgets/global_snackbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../exports.dart';

class ProfileController extends GetxController
    with GetTickerProviderStateMixin {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  final Routes _routes = Get.find();

  late ScrollController ageSelectorScrollController;
  double pixelHolder = 0.0;

  RxBool genderIsWoman = false.obs;
  RxInt selectedAgeIndex = 0.obs;

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
  late Animation<Offset> ageSelectorAnimation;
  late Animation<double> ageSelectorFadeAnimation;
  late Animation<Offset> buttonAnimation;
  late Animation<double> buttonFadeAnimation;

  final FirebaseService _firebaseService = Get.find();

  @override
  void onInit() {
    initializeAnimations();
    getDisplayName();
    getUserEmail();
    super.onInit();
  }

  @override
  void onClose() {
    ageSelectorScrollController.dispose();
    animationController.dispose();
    emailController.dispose();
    nameController.dispose();
    super.onClose();
  }

  logout() async {
    await _firebaseService.logout();
    Get.offAllNamed(_routes.authRoute);
  }

  updateSelectedAgeDependOnScroll() {
    if (ageSelectorScrollController.position.pixels > pixelHolder + 50) {
      pixelHolder = ageSelectorScrollController.position.pixels;
      if (selectedAgeIndex.value < 80) {
        increaseSelectedAgeIndex();
      }
    } else if (ageSelectorScrollController.position.pixels < pixelHolder - 50) {
      pixelHolder = ageSelectorScrollController.position.pixels;
      if (selectedAgeIndex.value > 0) {
        decreaseSelectedAgeIndex();
      }
    }
  }

  void getUserEmail() =>
      emailController.text = _firebaseService.getUser()?.email ?? "";

  String getPhotoUrl() => _firebaseService.getUser()?.photoURL ?? "";

  void getDisplayName() =>
      nameController.text = _firebaseService.getUser()?.displayName ?? "";

  void updateProfile({email, name, photoUrl}) async {
    try {
      bool status = await _firebaseService.updateUserInfo(
          email: email, name: name, photo: photoUrl);
      if (status) {
        Get.back();
      } else {
        globalSnackbar(content: "Failed please try again!");
      }
    } catch (e) {
      globalSnackbar(content: e.toString());
    }
  }

  increaseSelectedAgeIndex() => selectedAgeIndex(selectedAgeIndex.value + 1);

  decreaseSelectedAgeIndex() => selectedAgeIndex(selectedAgeIndex.value - 1);

  setManAsGender() => genderIsWoman(false);

  setWomanAsGender() => genderIsWoman(true);

  setSelectedAgeIndex(int index) => selectedAgeIndex(index);

  initializeAnimations() {
    ageSelectorScrollController = ScrollController()
      ..addListener(() {
        updateSelectedAgeDependOnScroll();
      });
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
    genderSelectorAnimation =
        Tween<Offset>(begin: beginOffset, end: Offset.zero).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(.59, 1, curve: Curves.ease),
      ),
    );
    genderSelectorFadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(.59, 1, curve: Curves.ease),
      ),
    );
    ageSelectorAnimation =
        Tween<Offset>(begin: beginOffset, end: Offset.zero).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(.72, 1, curve: Curves.ease),
      ),
    );
    ageSelectorFadeAnimation = Tween<double>(begin: 0, end: 1).animate(
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
