import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

import '../../../core/values/colors.dart';
import '../../../core/values/dimes.dart';
import '../../../core/values/strings.dart';
import '../../../routes/routes.dart';
import '../controller.dart';

class GenderSelector extends StatelessWidget {
  GenderSelector({Key? key}) : super(key: key);

  final AppColors _colors = Get.find();
  final Strings _strings = Get.find();
  final Routes _routes = Get.find();
  final Dimens _dimens = Get.find();
  final ProfileController _profileController = Get.find();

  @override
  Widget build(BuildContext context) {
    const duration = Duration(milliseconds: 300);
    return Container(
      margin: EdgeInsets.symmetric(vertical: _dimens.defaultMargin),
      child: Obx(
        () => Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: () => _profileController.setManAsGender(),
              child: AnimatedContainer(
                curve: Curves.easeOut,
                decoration: BoxDecoration(
                  color: (_profileController.gender.value != 1)
                      ? _colors.pastelCyan.withOpacity(.05)
                      : _colors.pastelCyan,
                  shape: BoxShape.circle,
                ),
                duration: duration,
                child: Padding(
                  padding: EdgeInsets.all(_dimens.defaultPadding * 3),
                  child: Icon(
                    Ionicons.man_outline,
                    size: _dimens.defaultIconSize * 2.5,
                    color: (_profileController.gender.value != 1)
                        ? _colors.pastelCyan
                        : _colors.frostedBlack,
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () => _profileController.setWomanAsGender(),
              child: AnimatedContainer(
                curve: Curves.easeOut,
                duration: duration,
                decoration: BoxDecoration(
                  color: (_profileController.gender.value != 0)
                      ? _colors.pastelCyan.withOpacity(.05)
                      : _colors.pastelCyan,
                  shape: BoxShape.circle,
                ),
                child: Padding(
                  padding: EdgeInsets.all(_dimens.defaultPadding * 3),
                  child: Icon(
                    Ionicons.woman_outline,
                    size: _dimens.defaultIconSize * 2.5,
                    color: (_profileController.gender.value != 0)
                        ? _colors.pastelCyan
                        : _colors.frostedBlack,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
