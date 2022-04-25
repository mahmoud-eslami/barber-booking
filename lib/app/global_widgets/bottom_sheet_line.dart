import 'package:barber_booking/app/core/values/dimes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomSheetLine extends StatelessWidget {
  BottomSheetLine({Key? key}) : super(key: key);

  final Dimens _dimens = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 8,
      margin: EdgeInsets.only(
        top: _dimens.defaultMargin,
      ),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(.2),
        borderRadius: BorderRadius.circular(_dimens.defaultRadius),
      ),
    );
  }
}
