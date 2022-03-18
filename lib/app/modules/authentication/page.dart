import 'package:barber_booking/app/core/utils/size_config.dart';
import 'package:barber_booking/app/core/values/dimes.dart';
import 'package:barber_booking/app/global_widgets/global_button.dart';
import 'package:barber_booking/app/global_widgets/optimized_text.dart';
import 'package:barber_booking/app/global_widgets/parent_widget.dart';
import 'package:barber_booking/app/modules/authentication/controller.dart';
import 'package:barber_booking/app/modules/authentication/local_widget/barber_title.dart';
import 'package:barber_booking/app/modules/authentication/local_widget/auth_bottom_sheet.dart';
import 'package:barber_booking/app/modules/authentication/local_widget/terms_conditions_section.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/values/colors.dart';
import '../../core/values/strings.dart';
import '../../routes/routes.dart';

class AuthenticationPage extends StatelessWidget {
  AuthenticationPage({Key? key}) : super(key: key);

  final AppColors _colors = Get.find();
  final Strings _strings = Get.find();
  final Routes _routes = Get.find();
  final Dimens _dimens = Get.find();
  final AuthenticationController _authenticationController = Get.find();

  showBottomSheet(child, context) {
    showModalBottomSheet(
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(_dimens.defaultRadius),
          ),
        ),
        context: context,
        builder: (context) => child);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ParentWidget(
          child: Padding(
            padding: EdgeInsets.all(_dimens.defaultPadding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SlideTransition(
                  position: _authenticationController.titleSlideAnimation,
                  child: FadeTransition(
                    opacity: _authenticationController.titleAnimation,
                    child: Center(
                      child: BarberTitle(),
                    ),
                  ),
                ),
                SlideTransition(
                  position: _authenticationController.imageSlideAnimation,
                  child: FadeTransition(
                    opacity: _authenticationController.imageAnimation,
                    child: Image.asset(
                      "assets/images/hairstyle.png",
                      height: SizeConfig.heightMultiplier * 30,
                    ),
                  ),
                ),
                SlideTransition(
                  position: _authenticationController.descriptionSlideAnimation,
                  child: FadeTransition(
                    opacity: _authenticationController.descriptionAnimation,
                    child: OptimizedText(
                      _strings.findBarberDescription,
                      customColor: _colors.lightTxtColor,
                      maxLine: 2,
                    ),
                  ),
                ),
                Column(
                  children: [
                    SlideTransition(
                      position:
                          _authenticationController.registerBtnSlideAnimation,
                      child: FadeTransition(
                        opacity: _authenticationController.registerBtnAnimation,
                        child: GlobalButton(
                          child: OptimizedText(
                            _strings.registerTitle,
                            fontWeight: FontWeight.bold,
                          ),
                          color: _colors.pastelCyan,
                          onPressed: () {
                            showBottomSheet(
                                AuthBottomSheet(isRegister: true), context);
                          },
                          radius: _dimens.defaultRadius,
                          height: _dimens.defaultButtonHeight,
                          width: SizeConfig.widthMultiplier * 70,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SlideTransition(
                      position:
                          _authenticationController.loginBtnSlideAnimation,
                      child: FadeTransition(
                        opacity: _authenticationController.loginBtnAnimation,
                        child: GlobalButton(
                          child: OptimizedText(
                            _strings.loginTitle,
                            customColor: _colors.lightTxtColor,
                            fontWeight: FontWeight.bold,
                          ),
                          color: _colors.pastelCyan,
                          elevation: 0,
                          onPressed: () {
                            showBottomSheet(
                                AuthBottomSheet(isRegister: false), context);
                          },
                          borderedButton: true,
                          borderColor: _colors.lightTxtColor,
                          radius: _dimens.defaultRadius,
                          height: _dimens.defaultButtonHeight,
                          width: SizeConfig.widthMultiplier * 70,
                        ),
                      ),
                    ),
                  ],
                ),
                SlideTransition(
                  position: _authenticationController.termsSlideAnimation,
                  child: FadeTransition(
                    opacity: _authenticationController.termsAnimation,
                    child: TermsConditionsSection(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
