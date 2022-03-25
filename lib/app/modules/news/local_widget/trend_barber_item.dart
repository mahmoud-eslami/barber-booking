import 'package:barber_booking/app/exports.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/utils/size_config_helper.dart';

class TrendBarberItem extends StatelessWidget {
  TrendBarberItem({Key? key}) : super(key: key);

  final AppColors _colors = Get.find();
  final Strings _strings = Get.find();
  final Routes _routes = Get.find();
  final Dimens _dimens = Get.find();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(_routes.barberShopProfile),
      child: Container(
        height: SizeConfig.heightMultiplier * 2,
        margin: EdgeInsets.only(
          right: _dimens.defaultMargin * 2,
        ),
        child: Material(
          borderRadius: BorderRadius.circular(_dimens.defaultRadius * .7),
          clipBehavior: Clip.hardEdge,
          child: Image.asset(
            "assets/images/design.png",
            width: SizeConfig.widthMultiplier * 80,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
