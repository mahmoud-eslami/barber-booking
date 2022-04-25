import 'dart:async';

import 'package:barber_booking/app/data/model/story/story.dart';
import 'package:barber_booking/app/data/services/firebase_service.dart';
import 'package:barber_booking/app/global_widgets/global_snackbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class StoryController extends GetxController {
  late Timer _timer;
  RxInt timerLimit = 0.obs;
  final FirebaseService _firebaseService = Get.find();
  final StoryModel item = Get.arguments;
  RxBool storyLiked = false.obs;

  @override
  void onInit() {
    calculateLikeStatus().then((value) => timerInitialize());
    super.onInit();
  }

  @override
  void onClose() {
    _timer.cancel();
    super.onClose();
  }

  Future calculateLikeStatus() async {
    try {
      User? user = _firebaseService.getUser();

      print(item.likes);
      if (item.likes.contains(user?.uid)) {
        storyLiked(true);
      } else {
        storyLiked(false);
      }
    } catch (e) {
      globalSnackbar(content: e.toString());
    }
  }

  Future likeStory() async {
    try {
      storyLiked(!storyLiked.value);
      await _firebaseService.likeStory(item.id);
    } catch (e) {
      globalSnackbar(content: e.toString());
    }
  }

  Future seenStory() async {
    try {
      await _firebaseService.seenStory(item.id);
    } catch (e) {
      globalSnackbar(content: e.toString());
    }
  }

  timerInitialize() {
    const onSecond = Duration(seconds: 1);
    _timer = Timer.periodic(onSecond, (timer) {
      if (timerLimit.value == 10) {
        seenStory().then((value) {
          Get.back();
          onClose();
        }).catchError((e) {
          globalSnackbar(
              content:
                  "Internet connection error , please check your connection");
        });
      } else {
        timerLimit++;
      }
    });
  }
}
