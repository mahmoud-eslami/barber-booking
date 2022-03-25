import 'package:barber_booking/app/core/utils/size_config_helper.dart';
import 'package:barber_booking/app/modules/story/local_widget/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/values/colors.dart';
import '../../core/values/dimes.dart';
import '../../core/values/strings.dart';
import '../../routes/routes.dart';
import 'local_widget/back_button.dart';

class StoryPage extends StatelessWidget {
  StoryPage({
    Key? key,
    this.imagePath,
    this.barberShopName,
  }) : super(key: key);

  final String? imagePath;
  final String? barberShopName;

  final AppColors _colors = Get.find();
  final Strings _strings = Get.find();
  final Routes _routes = Get.find();
  final Dimens _dimens = Get.find();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: SizeConfig.heightMultiplier * 100,
          child: Image.asset(
            imagePath ?? "assets/images/design.png",
            fit: BoxFit.cover,
          ),
        ),
        StoryBackButton(),
        BottomBar(),
      ],
    );
  }
}
