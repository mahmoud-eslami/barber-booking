import 'package:barber_booking/app/data/services/firebase_service.dart';
import 'package:barber_booking/app/global_widgets/global_snackbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../data/model/barber_shop/barber_shop.dart';

class BarberShopProfileController extends GetxController
    with GetTickerProviderStateMixin {
  final BarberShopModel _barberShopItemModel = Get.arguments;
  final FirebaseService _firebaseService = Get.find();

  late AnimationController animationController;

  late Animation<double> fadeLikeButtonAnimation;
  late Animation<Offset> slideLikeButtonAnimation;
  late Animation<double> fadeTagsAnimation;
  late Animation<Offset> slideTagsAnimation;
  late Animation<double> fadeDescriptionAnimation;
  late Animation<Offset> slideDescriptionAnimation;
  late Animation<double> fadeBookButtonAnimation;
  late Animation<Offset> slideBookButtonAnimation;

  RxBool likeStatus = false.obs;

  @override
  void onInit() {
    initializeAnimatoins();
    getBarberShopStatus();
    super.onInit();
  }

  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }

  void getBarberShopStatus() async => likeStatus(await _firebaseService
      .checkBarberShopLikeStatus(_barberShopItemModel.id));

  void likeBarberShop() async {
    _firebaseService
        .likeBarberShop(_barberShopItemModel.id)
        .then((value) => likeStatus(!likeStatus.value))
        .catchError((error) {
      globalSnackbar(content: error);
    });
  }

  void initializeAnimatoins() {
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
    slideTagsAnimation =
        Tween<Offset>(begin: beginOffset, end: Offset.zero).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(.33, 1, curve: Curves.ease),
      ),
    );
    fadeTagsAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(.33, 1, curve: Curves.ease),
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
  }
}
