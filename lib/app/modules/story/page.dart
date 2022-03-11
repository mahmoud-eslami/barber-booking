import 'dart:io';
import 'dart:ui';

import 'package:barber_booking/app/core/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

import '../../core/values/colors.dart';
import '../../core/values/dimes.dart';
import '../../core/values/strings.dart';
import '../../routes/routes.dart';

class StoryPage extends StatelessWidget {
  StoryPage({
    Key? key,
    this.imagePath,
    this.barberShopName,
  }) : super(key: key);

  final String? imagePath;
  final String? barberShopName;

  final AppColors _colors = Get.find();
  final Strings _strings = Get.find();
  final Routes _routes = Get.find();
  final Dimens _dimens = Get.find();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: SizeConfig.heightMultiplier * 100,
          child: Image.asset(
            imagePath ?? "assets/images/design.png",
            fit: BoxFit.cover,
          ),
        ),
        SafeArea(
          child: Container(
            margin: EdgeInsets.all(_dimens.defaultMargin),
            child: GestureDetector(
              onTap: () => Get.back(),
              child: ClipRRect(
                borderRadius:
                    BorderRadius.circular(_dimens.defaultRadius * 100),
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 20,
                    sigmaY: 20,
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(_dimens.defaultPadding * 3),
                    child: Icon(
                      (Platform.isIOS || Platform.isMacOS)
                          ? Icons.arrow_back_ios
                          : Icons.arrow_back,
                      color: _colors.lightTxtColor,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        Align(
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
                    child: ClipRRect(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(
                          sigmaX: 20,
                          sigmaY: 20,
                        ),
                        child: Material(
                          color: Colors.transparent,
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
                                const Expanded(
                                  child: SizedBox(
                                    width: 1,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Ionicons.flag_outline,
                                    size: _dimens.defaultIconSize * 1.2,
                                  ),
                                ),
                              ],
                            ),
                          ),
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
        ),
      ],
    );
  }
}
