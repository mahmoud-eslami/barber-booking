import 'package:barber_booking/app/core/utils/size_config.dart';
import 'package:barber_booking/app/core/values/colors.dart';
import 'package:barber_booking/app/core/values/dimes.dart';
import 'package:barber_booking/app/core/values/strings.dart';
import 'package:barber_booking/app/global_widgets/optimized_text.dart';
import 'package:barber_booking/app/modules/splash/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../global_widgets/global_button.dart';
import '../../routes/routes.dart';

class SplashPage extends StatelessWidget {
  SplashPage({Key? key}) : super(key: key);

  final AppColors _colors = Get.find();
  final Strings _strings = Get.find();
  final Routes _routes = Get.find();
  final Dimens _dimens = Get.find();
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
          SlideTransition(
            position: _splashController.alignAnimationText,
            child: FadeTransition(
              opacity: _splashController.fadeAnimationText,
              child: SafeArea(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    margin: EdgeInsets.only(bottom: _dimens.defaultMargin * 15),
                    child: OptimizedText(
                      _strings.startDescription,
                      customColor: _colors.lightTxtColor,
                      maxLine: 3,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SlideTransition(
            position: _splashController.alignAnimationButton,
            child: FadeTransition(
              opacity: _splashController.fadeAnimationButton,
              child: Padding(
                padding: EdgeInsets.all(_dimens.defaultPadding),
                child: SafeArea(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: GlobalButton(
                      child: OptimizedText(
                        _strings.startButton,
                        fontWeight: FontWeight.bold,
                      ),
                      color: _colors.pastelCyan,
                      onPressed: () {
                        Get.toNamed(_routes.authRoute);
                      },
                      radius: _dimens.defaultRadius,
                      height: _dimens.defaultButtonHeight,
                      width: SizeConfig.widthMultiplier * 70,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
