import 'package:barber_booking/app/core/utils/size_config_helper.dart';
import 'package:barber_booking/app/core/values/dimes.dart';
import 'package:barber_booking/app/data/enums/text_color_option.dart';
import 'package:barber_booking/app/data/enums/text_size_option.dart';
import 'package:barber_booking/app/global_widgets/optimized_text.dart';
import 'package:barber_booking/app/modules/nearest_barber_shop/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/values/colors.dart';
import '../../core/values/strings.dart';
import '../../routes/routes.dart';
import 'local_widget/barber_shops_line.dart';
import 'local_widget/nearest_barber_shop_search_bar.dart';

class NearestBarberShop extends StatelessWidget {
  NearestBarberShop({Key? key}) : super(key: key);

  final AppColors _colors = Get.find();
  final Strings _strings = Get.find();
  final Routes _routes = Get.find();
  final Dimens _dimens = Get.find();
  final NearestBarberShopController _nearestBarberShopController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: _dimens.defaultPadding * 2),
        child: Column(
          children: [
            SlideTransition(
              position: _nearestBarberShopController.slideSearchBarAnimation,
              child: FadeTransition(
                  opacity: _nearestBarberShopController.fadeSearchBarAnimation,
                  child: NearBarberShopSearchBar()),
            ),
            SizedBox(
              height: SizeConfig.heightMultiplier * 2,
            ),
            SlideTransition(
              position: _nearestBarberShopController.slideSearchResultAnimation,
              child: FadeTransition(
                opacity: _nearestBarberShopController.fadeSearchResultAnimation,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: OptimizedText(
                        "Search results",
                        colorOption: TextColorOptions.light,
                        textAlign: TextAlign.start,
                        fontWeight: FontWeight.bold,
                        sizeOption: TextSizeOptions.bigBody,
                      ),
                    ),
                    Expanded(
                      child: Obx(() => OptimizedText(
                            "${_nearestBarberShopController.barberShopsList.length} results",
                            colorOption: TextColorOptions.light,
                            textAlign: TextAlign.end,
                            sizeOption: TextSizeOptions.caption,
                          )),
                    ),
                  ],
                ),
              ),
            ),
            BarberShopsItemsList(),
          ],
        ),
      ),
    );
  }
}
