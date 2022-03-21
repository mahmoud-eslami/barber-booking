import 'dart:math';

import 'package:barber_booking/app/data/enums/home_state.dart';
import 'package:barber_booking/app/data/services/firebase_service.dart';
import 'package:barber_booking/app/data/services/location_service.dart';
import 'package:barber_booking/app/global_widgets/global_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import "package:latlong2/latlong.dart";

import '../../core/utils/size_config.dart';
import '../../exports.dart';

class HomeController extends GetxController {
  final FirebaseService _firebaseService = Get.find();

  late MapController mapController;
  RxBool navItemPressed = false.obs;
  late Position userPosition;
  RxBool getLocationLoading = true.obs;
  Set<Marker> markers = {};

  Rx<HomeState> pageState = HomeState.initial.obs;

  final AppColors _colors = Get.find();
  final Strings _strings = Get.find();
  final Routes _routes = Get.find();

  @override
  void onInit() {
    initializeMapController();
    checkLocationStatus();
    checkUserVerificationState();
    super.onInit();
  }

  initializeMapController() => mapController = MapController();

  checkUserVerificationState() async {
    try {
      bool verificationState =
          await _firebaseService.checkUserVerificationState();

      if (verificationState) {
        pageState(HomeState.userVerified);
      } else {
        showVerificationSnackbar();
        pageState(HomeState.userNotVerified);
      }
    } catch (e) {
      pageState(HomeState.userNotVerified);
      globalSnackbar(content: e.toString());
    }
  }

  showVerificationSnackbar() {
    if (!Get.isSnackbarOpen) {
      globalSnackbar(
        content:
            "User not verified , please verify email and press check button",
        isPermanet: true,
        snackPosition: SnackPosition.TOP,
        dismissDirection: DismissDirection.up,
        onTap: () {
          checkUserVerificationState();
        },
      );
    }
  }

  createListOfRandomDistance() {
    var rng = Random();
    var list = List.generate(3, (_) => rng.nextInt(10));
    return list.map((e) => e / 200);
  }

  addUserLocationMarker() {
    Marker userLocationMarker = Marker(
      width: 80.0,
      height: 80.0,
      point: LatLng(
        userPosition.latitude,
        userPosition.longitude,
      ),
      builder: (ctx) => Icon(
        Ionicons.pin_sharp,
        color: _colors.pastelCyan,
        size: SizeConfig.widthMultiplier * 10,
      ),
    );

    markers.add(userLocationMarker);
  }

  createFakeBarberShopNearUser() {
    var distances = createListOfRandomDistance();
    for (var element in distances) {
      Marker newMarker = Marker(
        width: 80.0,
        height: 80.0,
        point: LatLng(
          userPosition.latitude + element,
          userPosition.longitude - element,
        ),
        builder: (ctx) => GestureDetector(
          onTap: () => mapController.move(
              LatLng(userPosition.latitude + element,
                  userPosition.longitude - element),
              12),
          child: Icon(
            Ionicons.location,
            color: _colors.pastelCyan,
            size: SizeConfig.widthMultiplier * 10,
          ),
        ),
      );

      markers.add(newMarker);
    }
  }

  checkLocationStatus() async {
    try {
      userPosition = await CustomLocationService.determinePosition();
      await addUserLocationMarker();
      await createFakeBarberShopNearUser();
      getLocationLoading(false);
    } catch (e, s) {
      print(e);
      print(s);
    }
  }

  pressNavItem() => navItemPressed(true);

  releaseNavItem() => navItemPressed(false);
}
