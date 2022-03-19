import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

import '../exports.dart';

void globalSnackbar({
  required String content,
  DismissDirection dismissDirection = DismissDirection.down,
  bool isPermanet = false,
}) {
  final AppColors _colors = Get.find();
  final Dimens _dimens = Get.find();
  final Strings _strings = Get.find();

  Get.snackbar(
    _strings.noticeTitle,
    content,
    icon: Icon(Ionicons.notifications, color: _colors.frostedBlack),
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: _colors.pastelCyan,
    borderRadius: _dimens.defaultRadius * .5,
    margin: EdgeInsets.all(_dimens.defaultMargin),
    colorText: _colors.frostedBlack,
    duration: isPermanet ? null : const Duration(seconds: 4),
    isDismissible: true,
    dismissDirection: dismissDirection,
    forwardAnimationCurve: Curves.easeOutBack,
  );
}
