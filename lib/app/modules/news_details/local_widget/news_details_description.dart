import 'package:barber_booking/app/exports.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

import '../../../core/utils/size_config_helper.dart';
import '../../../data/enums/text_color_option.dart';
import '../../../data/enums/text_size_option.dart';
import '../../../global_widgets/optimized_text.dart';
import '../controller.dart';

class NewsDetailsDescription extends StatelessWidget {
  NewsDetailsDescription({Key? key}) : super(key: key);

  final AppColors _colors = Get.find();
  final Strings _strings = Get.find();
  final Routes _routes = Get.find();
  final Dimens _dimens = Get.find();
  final NewsDetailsController _profileController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(_dimens.defaultPadding * 3),
      child: Column(
        children: [
          OptimizedText(
            "This is title of article",
            colorOption: TextColorOptions.light,
            textAlign: TextAlign.start,
            sizeOption: TextSizeOptions.bigBody,
            maxLine: 5,
          ),
          SizedBox(height: SizeConfig.heightMultiplier * 2),
          SlideTransition(
            position: _profileController.slideLikeButtonAnimation,
            child: FadeTransition(
              opacity: _profileController.fadeLikeButtonAnimation,
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        OptimizedText(
                          "2 min read",
                          colorOption: TextColorOptions.light,
                          textAlign: TextAlign.start,
                          sizeOption: TextSizeOptions.caption,
                          fontWeight: FontWeight.bold,
                          maxLine: 2,
                        ),
                        OptimizedText(
                          "5:22 PM",
                          colorOption: TextColorOptions.light,
                          textAlign: TextAlign.start,
                          sizeOption: TextSizeOptions.caption,
                          maxLine: 2,
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Get.toNamed(_routes.barberProfile),
                    child: Material(
                      borderRadius:
                          BorderRadius.circular(_dimens.defaultRadius * .5),
                      clipBehavior: Clip.hardEdge,
                      child: Image.asset(
                        "assets/images/avatar.jpeg",
                        width: 59,
                        height: 59,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: SizeConfig.widthMultiplier * 2,
                  ),
                  likeButton(),
                ],
              ),
            ),
          ),
          SizedBox(height: SizeConfig.heightMultiplier * 2),
          SlideTransition(
            position: _profileController.slideDescriptionAnimation,
            child: FadeTransition(
              opacity: _profileController.fadeDescriptionAnimation,
              child: OptimizedText(
                _strings.lorem + _strings.lorem + _strings.lorem,
                colorOption: TextColorOptions.light,
                maxLine: 100,
                textAlign: TextAlign.justify,
              ),
            ),
          ),
          SizedBox(
            height: SizeConfig.heightMultiplier * 8,
          ),
        ],
      ),
    );
  }

  tagsWidget() => SlideTransition(
        position: _profileController.slideTagsAnimation,
        child: FadeTransition(
          opacity: _profileController.fadeTagsAnimation,
          child: Wrap(
            alignment: WrapAlignment.start,
            crossAxisAlignment: WrapCrossAlignment.start,
            runAlignment: WrapAlignment.start,
            children: [
              for (int i = 0; i < 4; i++)
                Container(
                  margin: EdgeInsets.all(_dimens.defaultMargin * .3),
                  padding: EdgeInsets.all(_dimens.defaultPadding),
                  decoration: BoxDecoration(
                    color: _colors.pastelCyan.withOpacity(.2),
                    borderRadius: BorderRadius.circular(
                      _dimens.defaultRadius,
                    ),
                  ),
                  child: Text(
                    "Tags num $i",
                    style: TextStyle(
                      color: _colors.pastelCyan,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
            ],
          ),
        ),
      );

  likeButton() => Container(
        width: 59,
        height: 59,
        decoration: BoxDecoration(
          color: _colors.pastelCyan,
          shape: BoxShape.circle,
        ),
        child: Padding(
          padding: EdgeInsets.all(_dimens.defaultPadding * 2),
          child: Icon(
            Ionicons.heart,
            color: _colors.frostedBlack,
          ),
        ),
      );
}
