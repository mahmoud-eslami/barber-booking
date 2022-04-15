import 'package:barber_booking/app/data/model/appointments/appointments_item_data.dart';
import 'package:barber_booking/app/modules/appointments/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/values/dimes.dart';
import 'appointment_item.dart';

class AppointmentsItemsList extends StatelessWidget {
  AppointmentsItemsList({Key? key}) : super(key: key);

  final Dimens _dimens = Get.find();
  final AppointmentsController _appointmentsController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ListView.builder(
        padding: EdgeInsets.only(top: _dimens.defaultPadding * 3),
        itemCount: _appointmentsController.appointments.length,
        itemBuilder: (context, index) => AppointmentsItem(
          data: AppointmentsItemModel(
            isUpper: (index % 2 == 0),
            item: _appointmentsController.appointments[index],
          ),
        ),
      ),
    );
  }
}
