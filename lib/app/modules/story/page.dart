import 'package:barber_booking/app/core/utils/size_config_helper.dart';
import 'package:barber_booking/app/data/model/story/story.dart';
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
    required this.item,
  }) : super(key: key);

  final StoryModel item;

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
          child: Image.network(
            item.image,
            fit: BoxFit.cover,
          ),
        ),
        StoryBackButton(),
        BottomBar(),
      ],
    );
  }
}
