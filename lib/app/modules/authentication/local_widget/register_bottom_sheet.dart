import 'package:barber_booking/app/modules/authentication/local_widget/bottom_sheet_line.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/values/dimes.dart';

class RegisterBottomSheet extends StatelessWidget {
  RegisterBottomSheet({Key? key}) : super(key: key);

  final Dimens _dimens = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BottomSheetLine(),
      ],
    );
  }
}
