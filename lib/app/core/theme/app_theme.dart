import 'package:barber_booking/app/core/utils/material_color_creator_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../values/colors.dart';

class Theming {
  static final AppColors _colors = Get.find();

  ThemeData appTheme = ThemeData(
    primarySwatch: materialColorCreator(_colors.pastelCyan),
    primaryColor: _colors.pastelCyan,
    brightness: Brightness.dark,
    fontFamily: "bitter",
    scaffoldBackgroundColor: _colors.frostedBlack,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 25,
        fontFamily: "bitter",
      ),
    ),
  );
}
