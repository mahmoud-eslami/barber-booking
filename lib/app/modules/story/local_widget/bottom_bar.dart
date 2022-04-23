import 'package:barber_booking/app/modules/story/local_widget/comments_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

import '../../../core/utils/size_config_helper.dart';
import '../../../core/values/colors.dart';
import '../../../core/values/dimes.dart';
import '../../../core/values/strings.dart';
import '../../../routes/routes.dart';
import '../controller.dart';

class BottomBar extends StatelessWidget {
  BottomBar({Key? key}) : super(key: key);

  final AppColors _colors = Get.find();
  final Strings _strings = Get.find();
  final Routes _routes = Get.find();
  final Dimens _dimens = Get.find();
  final StoryController _storyController = Get.find();

  showBottomSheet(child, context) {
    showModalBottomSheet(
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(_dimens.defaultRadius),
          ),
        ),
        context: context,
        builder: (context) => child);
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: SizedBox(
        width: SizeConfig.widthMultiplier * 100,
        height: SizeConfig.heightMultiplier * 8,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: SizeConfig.widthMultiplier * 100,
                height: SizeConfig.heightMultiplier * 8,
                child: Material(
                  color: _colors.frostedBlack,
                  elevation: 0,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: _dimens.defaultPadding * 2),
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            _storyController.likeStory();
                          },
                          icon: Obx(
                            () => Icon(
                              _storyController.storyLiked.value
                                  ? Ionicons.heart
                                  : Ionicons.heart_outline,
                              color: _storyController.storyLiked.value
                                  ? _colors.likedHearth
                                  : null,
                              size: _dimens.defaultIconSize * 1.2,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: SizeConfig.widthMultiplier * 3,
                        ),
                        IconButton(
                          onPressed: () {
                            showBottomSheet(CommentsBottomSheet(), context);
                          },
                          icon: Icon(
                            Ionicons.chatbox_ellipses_outline,
                            size: _dimens.defaultIconSize * 1.2,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Obx(() => Align(
                  alignment: Alignment.topLeft,
                  child: AnimatedContainer(
                    width: SizeConfig.widthMultiplier *
                        (_storyController.timerLimit.value * 10),
                    height: 5,
                    decoration: BoxDecoration(
                      color: _colors.pastelCyan,
                      borderRadius: BorderRadius.circular(
                        _dimens.defaultRadius,
                      ),
                    ),
                    duration: const Duration(seconds: 1),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
