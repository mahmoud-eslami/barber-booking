import 'package:barber_booking/app/data/model/story/story.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/values/colors.dart';
import '../../../core/values/dimes.dart';
import '../../../core/values/strings.dart';
import '../../../routes/routes.dart';

class StoryItem extends StatelessWidget {
  StoryItem({
    Key? key,
    required this.item,
  }) : super(key: key);

  final StoryModel item;
  final AppColors _colors = Get.find();
  final Dimens _dimens = Get.find();
  final Strings _strings = Get.find();
  final Routes _routes = Get.find();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(_routes.storyRoute, arguments: item);
      },
      child: Container(
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
            color: _colors.coloredBorder,
            width: _dimens.storyItemBorderSize,
          ),
          boxShadow: [
            BoxShadow(
              color: _colors.pastelCyan.withOpacity(.5),
              blurRadius: 10,
              blurStyle: BlurStyle.outer,
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.all(_dimens.defaultPadding * .6),
          child: Material(
            borderRadius: BorderRadius.circular(
              _dimens.defaultRadius * .4,
            ),
            clipBehavior: Clip.hardEdge,
            child: ExtendedImage.network(
              item.thumbnail,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
