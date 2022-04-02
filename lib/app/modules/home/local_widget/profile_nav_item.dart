import 'package:barber_booking/app/core/utils/size_config_helper.dart';
import 'package:barber_booking/app/modules/home/controller.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/values/colors.dart';
import '../../../core/values/dimes.dart';
import '../../../core/values/strings.dart';
import '../../../routes/routes.dart';

class ProfileNavItem extends StatelessWidget {
  ProfileNavItem({Key? key}) : super(key: key);

  final AppColors _colors = Get.find();
  final Strings _strings = Get.find();
  final Routes _routes = Get.find();
  final Dimens _dimens = Get.find();
  final HomeController _homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: _strings.profileImageTag,
      child: Material(
        elevation: 0,
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(_dimens.defaultRadius * 2),
        clipBehavior: Clip.hardEdge,
        child: ExtendedImage.network(
          _homeController.getPhotoUrl(),
          width: SizeConfig.widthMultiplier * 8,
          height: SizeConfig.widthMultiplier * 8,
          fit: BoxFit.contain,
          cache: true,
          shape: BoxShape.circle,
          handleLoadingProgress: true,
        ),
      ),
    );
  }
}
