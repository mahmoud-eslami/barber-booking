import 'package:barber_booking/app/core/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

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

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: _strings.profileImageTag,
      child: Image.asset(
        "assets/images/user.png",
        width: SizeConfig.widthMultiplier * 8,
      ),
    );
  }
}
