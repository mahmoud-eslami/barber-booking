import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/values/colors.dart';

class TermsConditionsSection extends StatelessWidget {
  TermsConditionsSection({Key? key}) : super(key: key);

  final AppColors _colors = Get.find();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          children: [
            TextSpan(
              text: "By signing up you accept the ",
              style:
                  TextStyle(color: _colors.lightTxtColor, fontFamily: "bitter"),
            ),
            TextSpan(
              text: "Term of service",
              style:
                  TextStyle(color: _colors.greenTxtColor, fontFamily: "bitter"),
            ),
            TextSpan(
              text: " and ",
              style:
                  TextStyle(color: _colors.lightTxtColor, fontFamily: "bitter"),
            ),
            TextSpan(
              text: "Privacy policy",
              style:
                  TextStyle(color: _colors.greenTxtColor, fontFamily: "bitter"),
            ),
          ],
        ),
      ),
    );
  }
}
