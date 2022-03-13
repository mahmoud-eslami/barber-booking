import 'package:barber_booking/app/core/theme/app_theme.dart';
import 'package:barber_booking/app/core/values/colors.dart';
import 'package:barber_booking/app/core/values/dimes.dart';
import 'package:barber_booking/app/data/services/camera_service.dart';
import 'package:barber_booking/app/modules/add_story/controller.dart';
import 'package:barber_booking/app/modules/authentication/controller.dart';
import 'package:barber_booking/app/modules/authentication/page.dart';
import 'package:barber_booking/app/modules/home/controller.dart';
import 'package:barber_booking/app/modules/news/controller.dart';
import 'package:barber_booking/app/modules/profile/controller.dart';
import 'package:barber_booking/app/modules/splash/controller.dart';
import 'package:barber_booking/app/modules/terms_conditions/controller.dart';
import 'package:barber_booking/app/routes/routes.dart';
import 'package:get/get.dart';

import 'app/core/values/strings.dart';

class DependencyInjection {
  static void injector() {
    CustomCameraService.initializeCamera();

    Get.put(Strings());
    Get.put(AppColors());
    Get.put(Routes());
    Get.put(Theming());
    Get.put(Dimens());

    Get.lazyPut(() => SplashController(), fenix: true);
    Get.lazyPut(() => AuthenticationController(), fenix: true);
    Get.lazyPut(() => TermsConditionsController(), fenix: true);
    Get.lazyPut(() => HomeController(), fenix: true);
    Get.lazyPut(() => ProfileController(), fenix: true);
    Get.lazyPut(() => NewsController(), fenix: true);
    Get.lazyPut(() => AddStoryController(), fenix: true);
  }
}
