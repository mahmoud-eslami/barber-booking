import 'package:barber_booking/app/modules/appointments/page.dart';
import 'package:barber_booking/app/modules/barber_profile/page.dart';
import 'package:barber_booking/app/modules/barber_shop_profile/page.dart';
import 'package:barber_booking/app/modules/home/page.dart';
import 'package:barber_booking/app/modules/nearest_barber_shop/page.dart';
import 'package:barber_booking/app/modules/news/page.dart';
import 'package:barber_booking/app/modules/news_details/page.dart';
import 'package:barber_booking/app/modules/profile/page.dart';
import 'package:barber_booking/app/modules/splash/page.dart';
import 'package:barber_booking/app/modules/story/page.dart';
import 'package:barber_booking/app/modules/terms_conditions/page.dart';
import 'package:barber_booking/app/routes/routes.dart';
import 'package:get/get.dart';

import '../modules/add_story/page.dart';
import '../modules/authentication/page.dart';

class Pages {
  static final Routes _routes = Get.find();

  static final pages = <GetPage>[
    GetPage(name: _routes.initialRoute, page: () => SplashPage()),
    GetPage(name: _routes.homeRoute, page: () => HomePage()),
    GetPage(name: _routes.authRoute, page: () => AuthenticationPage()),
    GetPage(
        name: _routes.termsConditionsRoute, page: () => TermsConditionsPage()),
    GetPage(name: _routes.profileRoute, page: () => ProfilePage()),
    GetPage(name: _routes.newsRoute, page: () => NewsPage()),
    GetPage(
      name: _routes.storyRoute,
      page: () => StoryPage(
        item: Get.arguments,
      ),
    ),
    GetPage(name: _routes.barberProfile, page: () => BarberProfile()),
    GetPage(
      name: _routes.barberShopProfile,
      page: () => BarberShopProfile(
        item: Get.arguments,
      ),
    ),
    GetPage(name: _routes.addStory, page: () => AddStory()),
    GetPage(name: _routes.nearestBarberShop, page: () => NearestBarberShop()),
    GetPage(name: _routes.newsDetails, page: () => NewsDetailsPage()),
    GetPage(name: _routes.appointments, page: () => AppointmentsPage()),
  ];
}
