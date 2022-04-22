import 'package:barber_booking/app/exports.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/utils/size_config_helper.dart';
import '../../../data/enums/text_color_option.dart';
import '../../../data/enums/text_size_option.dart';
import '../../../data/model/post/post.dart';
import '../../../global_widgets/optimized_text.dart';
import '../controller.dart';

class NewsDetailsDescription extends StatelessWidget {
  NewsDetailsDescription({Key? key, required this.item}) : super(key: key);

  final PostModel item;
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
            item.title,
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
                          "${item.timeToRead} min read",
                          colorOption: TextColorOptions.light,
                          textAlign: TextAlign.start,
                          sizeOption: TextSizeOptions.caption,
                          fontWeight: FontWeight.bold,
                          maxLine: 2,
                        ),
                        OptimizedText(
                          item.releaseTime,
                          colorOption: TextColorOptions.light,
                          textAlign: TextAlign.start,
                          sizeOption: TextSizeOptions.caption,
                          maxLine: 2,
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Get.toNamed(_routes.barberProfile,
                        arguments: item.barber),
                    child: Material(
                      borderRadius:
                          BorderRadius.circular(_dimens.defaultRadius * .5),
                      clipBehavior: Clip.hardEdge,
                      child: ExtendedImage.network(
                        item.barber.image,
                        width: 59,
                        height: 59,
                      ),
                    ),
                  ),
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
                item.description,
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
}
