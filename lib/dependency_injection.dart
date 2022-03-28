import 'package:barber_booking/app/core/theme/app_theme.dart';
import 'package:barber_booking/app/core/values/colors.dart';
import 'package:barber_booking/app/core/values/dimes.dart';
import 'package:barber_booking/app/data/services/camera_service.dart';
import 'package:barber_booking/app/data/services/firebase_service.dart';
import 'package:barber_booking/app/modules/add_story/controller.dart';
import 'package:barber_booking/app/modules/appointments/controller.dart';
import 'package:barber_booking/app/modules/authentication/controller.dart';
import 'package:barber_booking/app/modules/barber_shop_profile/controller.dart';
import 'package:barber_booking/app/modules/home/controller.dart';
import 'package:barber_booking/app/modules/nearest_barber_shop/controller.dart';
import 'package:barber_booking/app/modules/news/controller.dart';
import 'package:barber_booking/app/modules/news_details/controller.dart';
import 'package:barber_booking/app/modules/profile/controller.dart';
import 'package:barber_booking/app/modules/splash/controller.dart';
import 'package:barber_booking/app/modules/terms_conditions/controller.dart';
import 'package:barber_booking/app/routes/routes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

import 'app/core/values/strings.dart';
import 'app/data/services/location_service.dart';
import 'app/modules/barber_profile/controller.dart';

class DependencyInjection {
  static injectFirebase() async {
    await Firebase.initializeApp();
  }

  static void injector() {
    CustomCameraService.initializeCamera();

    Get.put(Strings());
    Get.put(AppColors());
    Get.put(Routes());
    Get.put(Theming());
    Get.put(Dimens());
    Get.put(FirebaseAuth.instance);
    Get.put(FirebaseFirestore.instance);
    Get.put(FirebaseService());
    Get.put(CustomLocationService());

    Get.lazyPut(() => SplashController(), fenix: true);
    Get.lazyPut(() => AuthenticationController(), fenix: true);
    Get.lazyPut(() => TermsConditionsController(), fenix: true);
    Get.lazyPut(() => HomeController(), fenix: true);
    Get.lazyPut(() => ProfileController(), fenix: true);
    Get.lazyPut(() => NewsController(), fenix: true);
    Get.lazyPut(() => AddStoryController(), fenix: true);
    Get.lazyPut(() => NearestBarberShopController(), fenix: true);
    Get.lazyPut(() => BarberShopProfileController(), fenix: true);
    Get.lazyPut(() => BarberProfileController(), fenix: true);
    Get.lazyPut(() => NewsDetailsController(), fenix: true);
    Get.lazyPut(() => AppointmentsController(), fenix: true);
  }
}
