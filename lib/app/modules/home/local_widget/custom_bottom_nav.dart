import 'package:barber_booking/app/core/values/dimes.dart';
import 'package:barber_booking/app/modules/home/local_widget/profile_nav_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

import '../../../core/values/colors.dart';
import '../../../core/values/strings.dart';
import '../../../routes/routes.dart';

class CustomBottomNav extends StatelessWidget {
  CustomBottomNav({Key? key}) : super(key: key);

  final AppColors _colors = Get.find();
  final Strings _strings = Get.find();
  final Routes _routes = Get.find();
  final Dimens _dimens = Get.find();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: _dimens.defaultPadding * 3),
        child: Container(
          margin: EdgeInsets.all(_dimens.defaultMargin * 2),
          height: _dimens.defaultButtonHeight,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(_dimens.defaultRadius),
            color: _colors.ericBlack,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(Ionicons.location_outline),
              Icon(Ionicons.newspaper),
              Icon(Ionicons.navigate),
              ProfileNavItem(),
            ],
          ),
        ),
      ),
    );
  }
}
