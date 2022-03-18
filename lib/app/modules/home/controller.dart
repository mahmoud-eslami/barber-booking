import 'dart:async';
import 'dart:math';

import 'package:barber_booking/app/data/services/location_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import "package:latlong2/latlong.dart";

import '../../core/utils/size_config.dart';
import '../../exports.dart';

class HomeController extends GetxController {
  RxBool navItemPressed = false.obs;
  late Position userPosition;
  RxBool getLocationLoading = true.obs;
  Set<Marker> markers = {};

  final AppColors _colors = Get.find();
  final Strings _strings = Get.find();
  final Routes _routes = Get.find();

  @override
  void onInit() {
    checkLocationStatus();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  createListOfRandomDistance() {
    var rng = Random();
    var list = List.generate(3, (_) => rng.nextInt(10));
    print(list);
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
        builder: (ctx) => Icon(
          Ionicons.location_outline,
          color: _colors.pastelCyan,
          size: SizeConfig.widthMultiplier * 10,
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
