import 'package:barber_booking/app/data/enums/news_state.dart';
import 'package:barber_booking/app/modules/news/controller.dart';
import 'package:barber_booking/app/modules/news/local_widget/story_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

import '../../../core/values/colors.dart';
import '../../../core/values/dimes.dart';

class StoriesLine extends StatelessWidget {
  StoriesLine({Key? key}) : super(key: key);
  final AppColors _colors = Get.find();
  final Dimens _dimens = Get.find();

  final NewsController _newsController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => _newsController.pageState.value == NewsState.getStoriesFailed
          ? Container(
              height: _dimens.storyLineHeight,
              margin: EdgeInsets.only(
                top: _dimens.defaultMargin,
              ),
              child: GestureDetector(
                onTap: () {
                  _newsController.getAllStories();
                },
                child: const Center(
                  child: Icon(Ionicons.refresh),
                ),
              ),
            )
          : Container(
              height: _newsController.storiesList.isEmpty
                  ? 0
                  : _dimens.storyLineHeight,
              margin: EdgeInsets.only(
                top: _dimens.defaultMargin,
              ),
              child: ListView.builder(
                padding: EdgeInsets.only(
                  left: _dimens.defaultPadding * 2,
                ),
                itemCount: _newsController.storiesList.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return StoryItem(
                    item: _newsController.storiesList[index],
                  );
                },
              ),
            ),
    );
  }
}
