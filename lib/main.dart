import 'package:barber_booking/app/core/theme/app_theme.dart';
import 'package:barber_booking/app/core/values/strings.dart';
import 'package:barber_booking/app/routes/pages.dart';
import 'package:barber_booking/app/routes/routes.dart';
import 'package:barber_booking/dependency_injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'app/core/utils/size_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DependencyInjection.injector();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Strings strings = Get.find();
    Routes routes = Get.find();
    Theming theming = Get.find();

    return LayoutBuilder(builder: (context, constraints) {
      return OrientationBuilder(builder: (context, orientation) {
        SizeConfig().init(constraints, orientation);
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: strings.title,
          theme: theming.appTheme,
          initialRoute: routes.initialRoute,
          getPages: Pages.pages,
        );
      });
    });
  }
}
