import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/values/colors.dart';
import '../data/enums/text_color_option.dart';
import '../data/enums/text_size_option.dart';

class CustomText extends GetResponsiveView {
  CustomText(
    this.txt, {
    Key? key,
    this.maxLine = 1,
    this.textAlign = TextAlign.center,
    this.sizeOption = TextSizeOptions.body,
    this.colorOption = TextColorOptions.dark,
    this.fontWeight = FontWeight.normal,
    this.customColor,
  }) : super(key: key, alwaysUseBuilder: true);
  final String txt;
  final int maxLine;
  final TextAlign textAlign;
  final TextSizeOptions sizeOption;
  final TextColorOptions colorOption;
  final FontWeight fontWeight;
  final Color? customColor;
  final AppColors _colors = Get.find();

  double setTextSize() {
    double? fontSize;
    if (sizeOption == TextSizeOptions.body) {
      fontSize = 19.0;
    } else if (sizeOption == TextSizeOptions.underline) {
      fontSize = 15.0;
    } else if (sizeOption == TextSizeOptions.button) {
      fontSize = 19.0;
    } else if (sizeOption == TextSizeOptions.caption) {
      fontSize = 14.0;
    } else if (sizeOption == TextSizeOptions.title) {
      fontSize = 30.0;
    } else if (sizeOption == TextSizeOptions.appBar) {
      fontSize = 25;
    } else if (sizeOption == TextSizeOptions.small) {
      fontSize = 12.0;
    }
    return fontSize ?? 14;
  }

  @override
  Widget? builder() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: AutoSizeText(
            txt,
            style: TextStyle(
              fontSize: setTextSize(),
              color: customColor ??
                  ((colorOption == TextColorOptions.hint)
                      ? _colors.hintTextColor.withOpacity(.6)
                      : (colorOption == TextColorOptions.light)
                          ? _colors.lightTxtColor
                          : _colors.darkTxtColor),
              fontWeight: fontWeight,
            ),
            overflow: TextOverflow.ellipsis,
            textAlign: textAlign,
            maxLines: maxLine,
            minFontSize: 5,
          ),
        ),
      ],
    );
  }
}
