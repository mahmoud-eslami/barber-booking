import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

import '../../../core/utils/size_config_helper.dart';
import '../../../core/values/colors.dart';
import '../../../core/values/dimes.dart';
import '../../../core/values/strings.dart';
import '../../../routes/routes.dart';

class BottomBar extends StatelessWidget {
  BottomBar({Key? key}) : super(key: key);

  final AppColors _colors = Get.find();
  final Strings _strings = Get.find();
  final Routes _routes = Get.find();
  final Dimens _dimens = Get.find();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: SizedBox(
        width: SizeConfig.widthMultiplier * 100,
        height: SizeConfig.heightMultiplier * 8,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: SizeConfig.widthMultiplier * 100,
                height: SizeConfig.heightMultiplier * 8,
                child: Material(
                  color: _colors.frostedBlack,
                  elevation: 0,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: _dimens.defaultPadding * 2),
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Ionicons.heart_outline,
                            size: _dimens.defaultIconSize * 1.2,
                          ),
                        ),
                        SizedBox(
                          width: SizeConfig.widthMultiplier * 3,
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Ionicons.chatbox_ellipses_outline,
                            size: _dimens.defaultIconSize * 1.2,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                width: SizeConfig.widthMultiplier * 50,
                height: 5,
                decoration: BoxDecoration(
                  color: _colors.pastelCyan,
                  borderRadius: BorderRadius.circular(
                    _dimens.defaultRadius,
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
