import 'dart:ui';

import 'package:barber_booking/app/data/model/barber_shop/barber_shop.dart';
import 'package:barber_booking/app/data/model/story/story.dart';
import 'package:barber_booking/app/data/services/firebase_service.dart';
import 'package:barber_booking/app/global_widgets/global_snackbar.dart';
import 'package:flutter/animation.dart';
import 'package:get/get.dart';

import '../../data/enums/pages_states/news_state.dart';

class NewsController extends GetxController with GetTickerProviderStateMixin {
  final FirebaseService _firebaseService = Get.find();
  RxList<StoryModel> storiesList = <StoryModel>[].obs;
  RxList<BarberShopModel> barberShopsList = <BarberShopModel>[].obs;
  Rx<NewsState> pageState = NewsState.init.obs;

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

  Future getAllStories() async {
    try {
      pageState(NewsState.loadingStories);
      List<StoryModel> stories = await _firebaseService.getAllStories();
      storiesList.addAll(stories);
      pageState(NewsState.getStoriesSuccess);
    } catch (e) {
      pageState(NewsState.getStoriesFailed);

      globalSnackbar(content: e.toString());
    }
  }

  Future getAllBarberShops() async {
    try {
      pageState(NewsState.loadingBarberShops);
      List<BarberShopModel> barberShops =
          await _firebaseService.getAllBarberShops();
      barberShopsList.addAll(barberShops);
      pageState(NewsState.getBarberShopsSuccess);
    } catch (e) {
      pageState(NewsState.getBarberShopsFailed);

      globalSnackbar(content: e.toString());
    }
  }

  @override
  void onInit() {
    clearAllListForInitialize();
    getAllStories().then(
      (value) => getAllBarberShops().then(
        (value) => initializeAnimations(),
      ),
    );
    super.onInit();
  }

  clearAllListForInitialize() {
    barberShopsList.clear();
    storiesList.clear();
  }

  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }

  initializeAnimations() {
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
  }
}
