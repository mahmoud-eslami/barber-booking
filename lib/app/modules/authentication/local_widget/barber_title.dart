import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

import '../../../core/utils/size_config.dart';
import '../../../core/values/colors.dart';
import '../../../core/values/strings.dart';
import '../../../data/enums/text_size_option.dart';
import '../../../global_widgets/optimized_text.dart';

class BarberTitle extends StatelessWidget {
  BarberTitle({Key? key}) : super(key: key);

  final AppColors _colors = Get.find();
  final Strings _strings = Get.find();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Ionicons.cut, color: _colors.lightTxtColor),
        SizedBox(
          width: SizeConfig.widthMultiplier * 65,
          child: OptimizedText(
            _strings.barberBookingTitle,
            customColor: _colors.lightTxtColor,
            fontWeight: FontWeight.bold,
            textAlign: TextAlign.center,
            sizeOption: TextSizeOptions.title,
          ),
        ),
      ],
    );
  }
}
