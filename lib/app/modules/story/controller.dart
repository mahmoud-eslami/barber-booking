import 'dart:async';

import 'package:get/get.dart';

class StoryController extends GetxController {
  late Timer _timer;
  RxInt timerLimit = 0.obs;

  @override
  void onInit() {
    timerInitialize();
    super.onInit();
  }

  @override
  void onClose() {
    _timer.cancel();
    super.onClose();
  }

  timerInitialize() {
    const onSecond = Duration(seconds: 1);
    _timer = Timer.periodic(onSecond, (timer) {
      if (timerLimit.value == 10) {
        Get.back();
        onClose();
      } else {
        timerLimit++;
      }
    });
  }
}
