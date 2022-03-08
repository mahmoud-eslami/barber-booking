import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/values/colors.dart';
import '../../core/values/strings.dart';
import '../../routes/routes.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final AppColors _colors = Get.find();
  final Strings _strings = Get.find();
  final Routes _routes = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
