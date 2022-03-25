import 'package:barber_booking/app/data/enums/nearest_barber_state.dart';
import 'package:barber_booking/app/global_widgets/global_error.dart';
import 'package:barber_booking/app/global_widgets/global_indicator.dart';
import 'package:barber_booking/app/modules/nearest_barber_shop/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/values/dimes.dart';
import 'barber_shop_item.dart';

class BarberShopsItemsList extends StatelessWidget {
  BarberShopsItemsList({Key? key}) : super(key: key);

  final Dimens _dimens = Get.find();
  final NearestBarberShopController _nearestBarberShopController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Obx(() {
        bool loading = _nearestBarberShopController.pageState.value ==
            NearestBarberState.barberShopsLoading;
        bool failed = _nearestBarberShopController.pageState.value ==
            NearestBarberState.barberShopsLoadingFailed;

        return loading
            ? const GlobalIndicator()
            : failed
                ? GlobalErrorWidget(
                    onTap: (() =>
                        _nearestBarberShopController.getAllBarberShops()))
                : ListView.builder(
                    padding: EdgeInsets.only(top: _dimens.defaultPadding * 3),
                    itemCount:
                        _nearestBarberShopController.barberShopsList.length,
                    itemBuilder: (context, index) {
                      return BarberShopItem(
                        isUpperWidget: (index % 2 == 0),
                        item:
                            _nearestBarberShopController.barberShopsList[index],
                      );
                    },
                  );
      }),
    );
  }
}
