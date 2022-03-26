import 'package:barber_booking/app/data/enums/nearest_barber_state.dart';
import 'package:barber_booking/app/data/model/barber_shop/barber_shop.dart';
import 'package:barber_booking/app/data/services/firebase_service.dart';
import 'package:barber_booking/app/global_widgets/global_snackbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class NearestBarberShopController extends GetxController
    with GetTickerProviderStateMixin {
  final FirebaseService _firebaseService = Get.find();

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
