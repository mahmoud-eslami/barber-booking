import 'dart:async';

import 'package:barber_booking/app/data/services/location_service.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxBool navItemPressed = false.obs;
  late Position userPosition;
  RxBool getLocationLoading = true.obs;

  @override
  void onInit() {
    checkLocationStatus();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  checkLocationStatus() async {
    try {
      userPosition = await CustomLocationService.determinePosition();
      getLocationLoading(false);
    } catch (e, s) {
      print(e);
      print(s);
    }
  }

  pressNavItem() => navItemPressed(true);

  releaseNavItem() => navItemPressed(false);
}
