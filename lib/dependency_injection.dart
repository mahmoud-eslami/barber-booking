import 'package:barber_booking/app/core/values/colors.dart';
import 'package:barber_booking/app/routes/routes.dart';
import 'package:get/get.dart';

import 'app/core/values/strings.dart';

class DependencyInjection {
  static void injector() {
    Get.put(Strings());
    Get.put(Colors());
    Get.put(Routes());
  }
}
