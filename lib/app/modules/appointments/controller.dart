import 'package:barber_booking/app/data/model/appointments/appointments.dart';
import 'package:barber_booking/app/data/services/firebase_service.dart';
import 'package:barber_booking/app/global_widgets/global_snackbar.dart';
import 'package:get/get.dart';

import '../../data/enums/pages_states/appointments_state.dart';
import '../../exports.dart';

class AppointmentsController extends GetxController {
  final FirebaseService _firebaseService = Get.find();
  Rx<AppointmentsState> pageState = AppointmentsState.init.obs;
  List<AppointmentsModel> appointments = <AppointmentsModel>[].obs;
  final Routes _routes = Get.find();

  void getAppointments() async {
    try {
      pageState(AppointmentsState.loading);
      List<AppointmentsModel> items = await _firebaseService.getAppointments();

      appointments.addAll(items);
      pageState(AppointmentsState.success);
    } catch (e) {
      pageState(AppointmentsState.failed);
      globalSnackbar(content: e.toString());
    }
  }

  void cancelAppointments(id) async => _firebaseService
          .cancelBooking(id)
          .then((value) => Get.offAndToNamed(_routes.announce, arguments: true))
          .catchError((e) {
        globalSnackbar(content: e.toString());
      });

  @override
  void onInit() {
    getAppointments();
    super.onInit();
  }

  @override
  void onClose() {
    var x = 0;
    super.onClose();
  }
}
