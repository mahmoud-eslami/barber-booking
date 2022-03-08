import 'package:barber_booking/app/core/utils/size_config.dart';
import 'package:barber_booking/app/data/enums/text_size_option.dart';
import 'package:barber_booking/app/global_widgets/global_button.dart';
import 'package:barber_booking/app/global_widgets/optimized_text.dart';
import 'package:barber_booking/app/global_widgets/parent_widget.dart';
import 'package:barber_booking/app/modules/authentication/controller.dart';
import 'package:barber_booking/app/modules/authentication/local_widget/barber_title.dart';
import 'package:barber_booking/app/modules/authentication/local_widget/login_bottom_sheet.dart';
import 'package:barber_booking/app/modules/authentication/local_widget/register_bottom_sheet.dart';
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
  final AuthenticationController _authenticationController = Get.find();

  showBottomSheet(child, context) {
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(30),
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
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FadeTransition(
                  opacity: _authenticationController.titleAnimation,
                  child: Center(
                    child: BarberTitle(),
                  ),
                ),
                FadeTransition(
                  opacity: _authenticationController.imageAnimation,
                  child: Image.asset(
                    "assets/images/hairstyle.png",
                    height: SizeConfig.heightMultiplier * 30,
                  ),
                ),
                FadeTransition(
                  opacity: _authenticationController.descriptionAnimation,
                  child: OptimizedText(
                    _strings.findBarberDescription,
                    customColor: _colors.lightTxtColor,
                    maxLine: 2,
                  ),
                ),
                Column(
                  children: [
                    FadeTransition(
                      opacity: _authenticationController.registerBtnAnimation,
                      child: GlobalButton(
                        child: OptimizedText(_strings.registerTitle),
                        color: _colors.springGreen,
                        onPressed: () {
                          showBottomSheet(const RegisterBottomSheet(), context);
                        },
                        radius: 50,
                        height: 60,
                        width: SizeConfig.widthMultiplier * 70,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    FadeTransition(
                      opacity: _authenticationController.loginBtnAnimation,
                      child: GlobalButton(
                        child: OptimizedText(
                          _strings.loginTitle,
                          customColor: _colors.lightTxtColor,
                        ),
                        color: _colors.springGreen,
                        elevation: 0,
                        onPressed: () {
                          showBottomSheet(LoginBottomSheet(), context);
                        },
                        borderedButton: true,
                        borderColor: _colors.lightTxtColor,
                        radius: 50,
                        height: 60,
                        width: SizeConfig.widthMultiplier * 70,
                      ),
                    ),
                  ],
                ),
                FadeTransition(
                  opacity: _authenticationController.termsAnimation,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "By signing up you accept the ",
                            style: TextStyle(
                                color: _colors.lightTxtColor,
                                fontFamily: "bitter"),
                          ),
                          TextSpan(
                            text: "Term of service",
                            style: TextStyle(
                                color: _colors.greenTxtColor,
                                fontFamily: "bitter"),
                          ),
                          TextSpan(
                            text: " and ",
                            style: TextStyle(
                                color: _colors.lightTxtColor,
                                fontFamily: "bitter"),
                          ),
                          TextSpan(
                            text: "Privacy policy",
                            style: TextStyle(
                                color: _colors.greenTxtColor,
                                fontFamily: "bitter"),
                          ),
                        ],
                      ),
                    ),
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
