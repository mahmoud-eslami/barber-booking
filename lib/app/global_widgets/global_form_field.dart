import 'package:barber_booking/app/core/values/colors.dart';
import 'package:barber_booking/app/core/values/dimes.dart';
import 'package:barber_booking/app/data/enums/text_size_option.dart';
import 'package:barber_booking/app/global_widgets/optimized_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GlobalTextFormField extends StatelessWidget {
  GlobalTextFormField({
    Key? key,
    required this.controller,
    required this.label,
  }) : super(key: key);

  final AppColors _colors = Get.find();
  final Dimens _dimens = Get.find();
  final TextEditingController controller;
  final String label;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        label: OptimizedText(
          label,
          textAlign: TextAlign.left,
          sizeOption: TextSizeOptions.caption,
          customColor: _colors.hintTextColor,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(_dimens.defaultRadius),
          borderSide:
              BorderSide(color: _colors.focusBorderFormFieldColor, width: 1.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(_dimens.defaultRadius),
          borderSide:
              BorderSide(color: _colors.enableBorderFormFieldColor, width: 1.0),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(_dimens.defaultRadius),
          borderSide:
              BorderSide(color: _colors.errorBorderFormFieldColor, width: 1.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(_dimens.defaultRadius),
          borderSide:
              BorderSide(color: _colors.errorBorderFormFieldColor, width: 1.0),
        ),
      ),
    );
  }
}
