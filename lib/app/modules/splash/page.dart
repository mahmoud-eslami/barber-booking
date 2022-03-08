import 'package:barber_booking/app/core/utils/size_config.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image.asset(
        "assets/images/barber_splash.png",
        fit: BoxFit.cover,
        height: SizeConfig.heightMultiplier * 100,
      ),
    );
  }
}
