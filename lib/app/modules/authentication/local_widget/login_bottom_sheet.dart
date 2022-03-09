import 'package:barber_booking/app/core/values/colors.dart';
import 'package:barber_booking/app/core/values/strings.dart';
import 'package:barber_booking/app/global_widgets/global_button.dart';
import 'package:barber_booking/app/global_widgets/global_form_field.dart';
import 'package:barber_booking/app/global_widgets/optimized_text.dart';
import 'package:barber_booking/app/modules/authentication/controller.dart';
import 'package:barber_booking/app/modules/authentication/local_widget/bottom_sheet_line.dart';
import 'package:barber_booking/app/modules/authentication/local_widget/terms_conditions_section.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/values/dimes.dart';

class LoginBottomSheet extends StatelessWidget {
  LoginBottomSheet({
    Key? key,
  }) : super(key: key);

  final Strings _strings = Get.find();
  final AppColors _colors = Get.find();
  final Dimens _dimens = Get.find();
  final AuthenticationController _authenticationController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BottomSheetLine(),
        GlobalTextFormField(
          controller: _authenticationController.emailController,
          label: "Email",
        ),
        GlobalTextFormField(
          controller: _authenticationController.passwordController,
          label: "password",
        ),
        GlobalButton(
          child: OptimizedText(_strings.loginTitle),
          color: _colors.springGreen,
          onPressed: () {},
          radius: _dimens.defaultRadius,
        ),
        TermsConditionsSection(),
      ],
    );
  }
}
