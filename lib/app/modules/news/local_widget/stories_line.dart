import 'package:barber_booking/app/modules/news/local_widget/story_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/values/colors.dart';
import '../../../core/values/dimes.dart';
import 'add_story.dart';

class StoriesLine extends StatelessWidget {
  StoriesLine({Key? key}) : super(key: key);
  final AppColors _colors = Get.find();
  final Dimens _dimens = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _dimens.storyLineHeight,
      margin: EdgeInsets.only(
        top: _dimens.defaultMargin,
      ),
      child: ListView(
        padding: EdgeInsets.only(
          left: _dimens.defaultPadding * 2,
        ),
        scrollDirection: Axis.horizontal,
        children: [AddStory(), for (int i = 0; i < 10; i++) StoryItem()],
      ),
    );
  }
}
