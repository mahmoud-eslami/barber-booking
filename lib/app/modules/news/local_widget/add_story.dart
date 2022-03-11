import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

import '../../../core/values/colors.dart';
import '../../../core/values/dimes.dart';

class AddStory extends StatelessWidget {
  AddStory({Key? key}) : super(key: key);

  final AppColors _colors = Get.find();
  final Dimens _dimens = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _dimens.storyItemHeight,
      height: _dimens.storyItemHeight,
      margin: EdgeInsets.only(
        right: _dimens.defaultMargin,
        top: (_dimens.storyLineHeight - _dimens.storyItemHeight) / 2,
        bottom: (_dimens.storyLineHeight - _dimens.storyItemHeight) / 2,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          _dimens.defaultRadius * .5,
        ),
        border: Border.all(
          color: _colors.lightBorder,
          width: _dimens.storyItemBorderSize,
        ),
      ),
      child: const Icon(Ionicons.add),
    );
  }
}
