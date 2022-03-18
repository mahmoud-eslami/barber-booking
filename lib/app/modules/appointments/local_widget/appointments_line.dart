import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/values/dimes.dart';
import 'appointment_item.dart';

class AppointmentsItemsList extends StatelessWidget {
  AppointmentsItemsList({Key? key}) : super(key: key);

  final Dimens _dimens = Get.find();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.only(top: _dimens.defaultPadding * 3),
      itemCount: 10,
      itemBuilder: (context, index) =>
          AppointmentsItem(isUpperWidget: (index % 2 == 0)),
    );
  }
}
