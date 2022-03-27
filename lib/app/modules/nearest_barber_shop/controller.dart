import 'dart:math';

import 'package:barber_booking/app/data/enums/nearest_barber_state.dart';
import 'package:barber_booking/app/data/model/barber_shop/barber_shop.dart';
import 'package:barber_booking/app/data/services/firebase_service.dart';
import 'package:barber_booking/app/data/services/location_service.dart';
import 'package:barber_booking/app/global_widgets/global_snackbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class NearestBarberShopController extends GetxController
    with GetTickerProviderStateMixin {
  final FirebaseService _firebaseService = Get.find();
  final CustomLocationService _customLocationService = Get.find();

  late AnimationController animationController;
  late Animation<double> fadeSearchBarAnimation;
  late Animation<Offset> slideSearchBarAnimation;
  late Animation<double> fadeSearchResultAnimation;
  late Animation<Offset> slideSearchResultAnimation;

  RxList<BarberShopModel> barberShopsList = <BarberShopModel>[].obs;
  RxList<BarberShopModel> filteredList = <BarberShopModel>[].obs;
  RxString searchQuery = ''.obs;
  Rx<NearestBarberState> pageState = NearestBarberState.init.obs;

  getFilteredItems(String query) {
    clearFilteredList();
    List<BarberShopModel> temp = barberShopsList;
    filteredList(
        temp.where((element) => element.title.contains(query)).toList());
  }

  bool getStateOfBarberShop(String startTime, String endTime) {
    DateTime now = DateTime.now();
    DateTime start = DateTime(now.year, now.month, now.day,
        int.parse(startTime.split(":")[0]), int.parse(startTime.split(":")[1]));
    DateTime end = DateTime(now.year, now.month, now.day,
        int.parse(endTime.split(":")[0]), int.parse(endTime.split(":")[1]));

    if (start.isBefore(now) && end.isAfter(now)) {
      return true;
    } else {
      return false;
    }
  }

  String distanceBetweenTwoPoints({required lat1, required lon1}) {
    var lat2 = _customLocationService.userPosition.latitude;
    var lon2 = _customLocationService.userPosition.longitude;
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 -
        c((lat2 - lat1) * p) / 2 +
        c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;

    var kmResult = 12742 * asin(sqrt(a));
    var meterResult = 1000 * kmResult;

    // check for distance and return ditance per meter if distance in less than one kilometer
    return (kmResult >= 1)
        ? "${kmResult.toStringAsFixed(2)} Kilometers away"
        : "${meterResult.toStringAsFixed(2)} meters away";
  }

  clearQuery() => searchQuery("");

  updateQuery(String query) => searchQuery(query);

  clearFilteredList() => filteredList.clear();

  getAllBarberShops() async {
    try {
      pageState(NearestBarberState.barberShopsLoading);
      List<BarberShopModel> data = await _firebaseService.getAllBarberShops();
      barberShopsList.addAll(data);
      pageState(NearestBarberState.barberShopsLoadedSuccess);
    } catch (e) {
      pageState(NearestBarberState.barberShopsLoadingFailed);
      globalSnackbar(content: e.toString());
    }
  }

  @override
  void onInit() {
    getAllBarberShops();
    getStateOfBarberShop("10:00", "23:00");

    const duration = Duration(milliseconds: 600);
    const beginOffset = Offset(0, .6);

    animationController = AnimationController(vsync: this, duration: duration)
      ..forward();
    slideSearchBarAnimation =
        Tween<Offset>(begin: beginOffset, end: Offset.zero).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(.13, 1, curve: Curves.ease),
      ),
    );
    fadeSearchBarAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(.13, 1, curve: Curves.ease),
      ),
    );
    slideSearchResultAnimation =
        Tween<Offset>(begin: beginOffset, end: Offset.zero).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(.33, 1, curve: Curves.ease),
      ),
    );
    fadeSearchResultAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(.33, 1, curve: Curves.ease),
      ),
    );

    super.onInit();
  }

  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }
}
