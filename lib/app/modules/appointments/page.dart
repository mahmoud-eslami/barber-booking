import 'package:barber_booking/app/data/enums/pages_states/appointments_state.dart';
import 'package:barber_booking/app/global_widgets/global_error.dart';
import 'package:barber_booking/app/global_widgets/global_indicator.dart';
import 'package:barber_booking/app/modules/appointments/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../exports.dart';
import 'local_widget/appointments_line.dart';

class AppointmentsPage extends StatelessWidget {
  AppointmentsPage({Key? key}) : super(key: key);

  final AppColors _colors = Get.find();
  final Strings _strings = Get.find();
  final Routes _routes = Get.find();
  final Dimens _dimens = Get.find();
  final AppointmentsController _appointmentsController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_strings.appointmentsTitle),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: _dimens.defaultPadding * 2),
        child: Obx(
          () => _appointmentsController.pageState.value ==
                  AppointmentsState.loading
              ? const Center(
                  child: GlobalIndicator(),
                )
              : _appointmentsController.pageState.value ==
                      AppointmentsState.failed
                  ? GlobalErrorWidget(
                      onTap: () => _appointmentsController.onInit())
                  : _appointmentsController.appointments.isEmpty
                      ? Center(
                          child: Text(_strings.noAppointmentTitle),
                        )
                      : AppointmentsItemsList(),
        ),
      ),
    );
  }
}
