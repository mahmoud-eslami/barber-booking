import 'package:barber_booking/app/modules/news/local_widget/trend_barber_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/utils/size_config_helper.dart';
import '../../../core/values/colors.dart';
import '../../../core/values/dimes.dart';
import '../../../core/values/strings.dart';
import '../../../routes/routes.dart';

class TrendsLine extends StatelessWidget {
  TrendsLine({Key? key}) : super(key: key);

  final AppColors _colors = Get.find();
  final Strings _strings = Get.find();
  final Routes _routes = Get.find();
  final Dimens _dimens = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.heightMultiplier * 10,
      margin: EdgeInsets.only(
        top: _dimens.defaultMargin,
      ),
      child: ListView.builder(
        padding: EdgeInsets.only(
          left: _dimens.defaultPadding * 2,
        ),
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) => TrendBarberItem(),
      ),
    );
  }
}
