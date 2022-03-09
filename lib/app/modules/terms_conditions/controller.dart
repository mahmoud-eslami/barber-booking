import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class TermsConditionsController extends GetxController {
  late ScrollController scrollController;
  RxBool showFab = false.obs;

  @override
  void onInit() {
    scrollController = ScrollController();
    scrollController.addListener(() {
      bool isCorrectPosition = scrollController.position.pixels > 200.0;
      bool isTop = scrollController.position.pixels == 0;
      if (isCorrectPosition) {
        showFab(true);
      }
      if (isTop) {
        showFab(false);
      }
    });
    super.onInit();
  }

  scrollToTop() {
    scrollController.animateTo(0,
        duration: const Duration(milliseconds: 400), curve: Curves.ease);
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }
}
