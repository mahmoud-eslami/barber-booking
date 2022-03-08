import 'package:barber_booking/app/global_widgets/global_form_field.dart';
import 'package:barber_booking/app/modules/authentication/controller.dart';
import 'package:barber_booking/app/modules/authentication/local_widget/bottom_sheet_line.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginBottomSheet extends StatelessWidget {
  LoginBottomSheet({Key? key}) : super(key: key);

  final AuthenticationController _authenticationController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BottomSheetLine(),
        GlobalTextFormField(
            controller: _authenticationController.emailController),
        GlobalTextFormField(
            controller: _authenticationController.passwordController),
      ],
    );
  }
}
