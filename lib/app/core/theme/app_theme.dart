import 'package:barber_booking/app/core/utils/material_color_creator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../values/colors.dart';

class Theming {
  static final AppColors _colors = Get.find();

  ThemeData appTheme = ThemeData(
    primarySwatch: materialColorCreator(_colors.springGreen),
    primaryColor: _colors.springGreen,
    brightness: Brightness.dark,
    fontFamily: "bitter",
    scaffoldBackgroundColor: _colors.ericBlack,
  );
}
