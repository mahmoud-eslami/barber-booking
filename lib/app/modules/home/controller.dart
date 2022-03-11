import 'dart:async';

import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxBool navItemPressed = false.obs;
  StreamSubscription<Position>? positionStream;

  @override
  void onInit() {
    liveLocationStream();
    super.onInit();
  }

  @override
  void onClose() {
    positionStream?.cancel();
    super.onClose();
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
        print(position == null
            ? 'Unknown'
            : '${position.latitude.toString()}, ${position.longitude.toString()}');
      });
    } catch (e) {
      print(e);
    }
  }

  pressNavItem() => navItemPressed(true);

  releaseNavItem() => navItemPressed(false);
}
