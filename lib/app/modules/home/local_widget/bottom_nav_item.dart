import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

import '../../../core/values/colors.dart';
import '../../../core/values/dimes.dart';
import '../../../core/values/strings.dart';
import '../../../routes/routes.dart';
import '../controller.dart';

class BottomNavItem extends StatelessWidget {
  BottomNavItem(
      {Key? key, this.customWidget, this.iconData, required this.onTap})
      : super(key: key);

  final Widget? customWidget;
  final IconData? iconData;
  final VoidCallback onTap;

  final AppColors _colors = Get.find();
  final Strings _strings = Get.find();
  final Routes _routes = Get.find();
  final Dimens _dimens = Get.find();
  final HomeController _homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details) {
        _homeController.pressNavItem();
      },
      onTapUp: (details) {
        _homeController.releaseNavItem();
      },
      onTap: onTap,
      child: customWidget ??
          Icon(
            iconData ?? Ionicons.sad_outline,
            size: _dimens.defaultIconSize,
          ),
    );
  }
}
