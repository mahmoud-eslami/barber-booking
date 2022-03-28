import 'package:barber_booking/app/modules/nearest_barber_shop/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

import '../../../core/values/colors.dart';
import '../../../core/values/strings.dart';
import '../../../routes/routes.dart';

class NearBarberShopSearchBar extends StatelessWidget {
  NearBarberShopSearchBar({Key? key}) : super(key: key);

  final AppColors _colors = Get.find();
  final Strings _strings = Get.find();
  final Routes _routes = Get.find();
  final NearestBarberShopController _nearestBarberShopController = Get.find();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: const InputDecoration(
        prefixIcon: Icon(Ionicons.search),
        label: Text("Barber shop"),
        contentPadding: EdgeInsets.zero,
        floatingLabelAlignment: FloatingLabelAlignment.start,
      ),
      onChanged: (value) {
        if (value.isEmpty) {
          _nearestBarberShopController.clearQuery();
          _nearestBarberShopController.clearFilteredList();
        } else {
          _nearestBarberShopController.updateQuery(value);
          _nearestBarberShopController.getFilteredItems(value);
        }
      },
    );
  }
}
