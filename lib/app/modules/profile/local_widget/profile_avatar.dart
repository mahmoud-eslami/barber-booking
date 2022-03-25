import 'package:barber_booking/app/core/values/dimes.dart';
import 'package:barber_booking/app/modules/profile/controller.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/utils/size_config_helper.dart';
import '../../../core/values/colors.dart';
import '../../../core/values/strings.dart';

class ProfileAvatar extends StatelessWidget {
  ProfileAvatar({Key? key}) : super(key: key);

  final Strings _strings = Get.find();
  final AppColors _colors = Get.find();
  final Dimens _dimens = Get.find();
  final ProfileController _profileController = Get.find();

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
          _profileController.getPhotoUrl(),
          width: SizeConfig.widthMultiplier * 35,
          height: SizeConfig.widthMultiplier * 35,
          fit: BoxFit.contain,
          cache: true,
          shape: BoxShape.circle,
          handleLoadingProgress: true,
        ),
      ),
    );
  }
}
