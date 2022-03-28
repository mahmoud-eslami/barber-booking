import 'package:barber_booking/app/core/utils/size_config_helper.dart';
import 'package:barber_booking/app/data/enums/text_color_option.dart';
import 'package:barber_booking/app/data/enums/text_size_option.dart';
import 'package:barber_booking/app/global_widgets/global_button.dart';
import 'package:barber_booking/app/global_widgets/optimized_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../exports.dart';

class GlobalErrorWidget extends StatelessWidget {
  GlobalErrorWidget({Key? key, required this.onTap}) : super(key: key);

  final VoidCallback onTap;

  final AppColors _colors = Get.find();
  final Strings _strings = Get.find();
  final Dimens _dimens = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        OptimizedText(
          _strings.errorWidgetTitle,
          sizeOption: TextSizeOptions.bigBody,
          colorOption: TextColorOptions.light,
        ),
        SizedBox(height: SizeConfig.heightMultiplier * 2),
        OptimizedText(
          _strings.errorWidgetDescription,
          sizeOption: TextSizeOptions.caption,
          colorOption: TextColorOptions.hint,
          maxLine: 2,
        ),
        SizedBox(height: SizeConfig.heightMultiplier * 2),
        GlobalButton(
          width: SizeConfig.widthMultiplier * 50,
          child: OptimizedText(
            _strings.errorWidgetButtonTitle,
            sizeOption: TextSizeOptions.button,
            fontWeight: FontWeight.bold,
          ),
          color: _colors.pastelCyan,
          onPressed: onTap,
          radius: _dimens.defaultRadius,
        )
      ],
    );
  }
}
