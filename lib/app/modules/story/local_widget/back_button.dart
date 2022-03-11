import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/values/colors.dart';
import '../../../core/values/dimes.dart';

class StoryBackButton extends StatelessWidget {
  StoryBackButton({Key? key}) : super(key: key);

  final AppColors _colors = Get.find();
  final Dimens _dimens = Get.find();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.all(_dimens.defaultMargin),
        child: GestureDetector(
          onTap: () => Get.back(),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(_dimens.defaultRadius * 100),
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
    );
  }
}
