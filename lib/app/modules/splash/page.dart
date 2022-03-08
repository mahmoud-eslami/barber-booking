import 'package:barber_booking/app/core/utils/size_config.dart';
import 'package:barber_booking/app/core/values/colors.dart';
import 'package:barber_booking/app/core/values/strings.dart';
import 'package:barber_booking/app/global_widgets/optimized_text.dart';
import 'package:barber_booking/app/modules/splash/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../global_widgets/global_button.dart';

class SplashPage extends StatelessWidget {
  SplashPage({Key? key}) : super(key: key);

  final AppColors _colors = Get.find();
  final Strings _strings = Get.find();
  final SplashController _splashController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ScaleTransition(
            scale: _splashController.scaleAnimation,
            child: Image.asset(
              "assets/images/barber_splash.png",
              fit: BoxFit.cover,
              height: SizeConfig.heightMultiplier * 100,
            ),
          ),
          FadeTransition(
            opacity: _splashController.fadeAnimation,
            child: SafeArea(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: GlobalButton(
                  child: OptimizedText(_strings.startButton),
                  color: _colors.springGreen,
                  onPressed: () {},
                  radius: 50,
                  height: 60,
                  width: SizeConfig.widthMultiplier * 70,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
