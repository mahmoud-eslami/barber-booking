import 'dart:ui';

import 'package:barber_booking/app/core/values/dimes.dart';
import 'package:barber_booking/app/modules/home/controller.dart';
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
  final HomeController _homeController = Get.find();

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
            // color: _colors.ericBlack,
            color: Colors.white.withOpacity(.08),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(_dimens.defaultRadius),
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 7,
                sigmaY: 7,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(
                    Ionicons.location_outline,
                    size: _dimens.defaultIconSize,
                  ),
                  Icon(
                    Ionicons.newspaper,
                    size: _dimens.defaultIconSize,
                  ),
                  Icon(
                    Ionicons.navigate,
                    size: _dimens.defaultIconSize,
                  ),
                  ProfileNavItem(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
