import 'package:get/get.dart';

class HomeController extends GetxController {
  RxBool navItemPressed = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  pressNavItem() => navItemPressed(true);

  releaseNavItem() => navItemPressed(false);
}
