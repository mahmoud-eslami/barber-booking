import 'dart:async';

import 'package:barber_booking/app/data/services/location_service.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxBool navItemPressed = false.obs;
  late RxObjectMixin<Position> userPosition;
  StreamSubscription<Position>? positionStream;

  @override
  void onInit() {
    checkLocationStatus();
    super.onInit();
  }

  @override
  void onClose() {
    positionStream?.cancel();
    super.onClose();
  }

  checkLocationStatus() async {
    try {
      await CustomLocationService.determinePosition();
      liveLocationStream();
    } catch (e, s) {
      print(e);
      print(s);
    }
  }

  liveLocationStream() {
    try {
      const LocationSettings locationSettings = LocationSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 100,
      );
      positionStream =
          Geolocator.getPositionStream(locationSettings: locationSettings)
              .listen((Position? position) {
        if (position != null) {
          userPosition(position);
        }
      });
    } catch (e) {
      print(e);
    }
  }

  pressNavItem() => navItemPressed(true);

  releaseNavItem() => navItemPressed(false);
}
