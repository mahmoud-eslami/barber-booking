import 'package:barber_booking/app/exports.dart';
import 'package:get/get.dart';

class AnnounceController extends GetxController {
  final Routes _routes = Get.find();

  @override
  void onInit() {
    navigateAfterSomeSec();
    super.onInit();
  }

  void navigateAfterSomeSec() async {
    Future.delayed(const Duration(seconds: 1)).then((value) => Get.back());
  }

  @override
  void onClose() {
    super.onClose();
  }
}
