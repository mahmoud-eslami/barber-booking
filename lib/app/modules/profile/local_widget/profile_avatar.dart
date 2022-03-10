import 'package:barber_booking/app/core/values/dimes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

import '../../../core/utils/size_config.dart';
import '../../../core/values/colors.dart';
import '../../../core/values/strings.dart';

class ProfileAvatar extends StatelessWidget {
  ProfileAvatar({Key? key}) : super(key: key);

  final Strings _strings = Get.find();
  final AppColors _colors = Get.find();
  final Dimens _dimens = Get.find();

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: _strings.profileImageTag,
      child: Stack(
        children: [
          Image.asset(
            "assets/images/user.png",
            width: SizeConfig.widthMultiplier * 35,
          ),
        ],
      ),
    );
  }
}
