import 'package:barber_booking/app/core/utils/size_config.dart';
import 'package:barber_booking/app/core/values/colors.dart';
import 'package:barber_booking/app/core/values/strings.dart';
import 'package:barber_booking/app/data/enums/text_size_option.dart';
import 'package:barber_booking/app/global_widgets/global_button.dart';
import 'package:barber_booking/app/global_widgets/global_form_field.dart';
import 'package:barber_booking/app/global_widgets/optimized_text.dart';
import 'package:barber_booking/app/modules/authentication/controller.dart';
import 'package:barber_booking/app/modules/authentication/local_widget/bottom_sheet_line.dart';
import 'package:barber_booking/app/modules/authentication/local_widget/terms_conditions_section.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/values/dimes.dart';

class AuthBottomSheet extends StatelessWidget {
  AuthBottomSheet({
    Key? key,
    required this.isRegister,
  }) : super(key: key);

  final bool isRegister;

  final Strings _strings = Get.find();
  final AppColors _colors = Get.find();
  final Dimens _dimens = Get.find();
  final AuthenticationController _authenticationController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(_dimens.defaultPadding),
      child: Stack(
        children: [
          Align(alignment: Alignment.topCenter, child: BottomSheetLine()),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OptimizedText(
                isRegister
                    ? "Enter your email and set a password"
                    : "Enter your email and password",
                customColor: _colors.lightTxtColor,
                sizeOption: TextSizeOptions.bigBody,
              ),
              SizedBox(
                height: SizeConfig.heightMultiplier * 4,
              ),
              GlobalTextFormField(
                controller: _authenticationController.emailController,
                label: "Email",
              ),
              SizedBox(
                height: SizeConfig.heightMultiplier * 1,
              ),
              GlobalTextFormField(
                controller: _authenticationController.passwordController,
                label: "password",
              ),
              SizedBox(
                height: SizeConfig.heightMultiplier * 1,
              ),
              GlobalButton(
                child: OptimizedText(
                  isRegister ? _strings.registerTitle : _strings.loginTitle,
                  fontWeight: FontWeight.bold,
                ),
                color: _colors.springGreen,
                onPressed: () {},
                radius: _dimens.defaultRadius,
                height: _dimens.defaultButtonHeight,
              ),
              SizedBox(
                height: SizeConfig.heightMultiplier * 7,
              ),
              TermsConditionsSection(),
            ],
          ),
        ],
      ),
    );
  }
}
