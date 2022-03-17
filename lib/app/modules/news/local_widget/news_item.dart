import 'dart:ui';

import 'package:barber_booking/app/core/utils/size_config.dart';
import 'package:barber_booking/app/data/enums/text_size_option.dart';
import 'package:barber_booking/app/global_widgets/optimized_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/values/colors.dart';
import '../../../core/values/dimes.dart';
import '../../../core/values/strings.dart';
import '../../../routes/routes.dart';

class NewsItem extends StatelessWidget {
  NewsItem({Key? key}) : super(key: key);

  final AppColors _colors = Get.find();
  final Strings _strings = Get.find();
  final Routes _routes = Get.find();
  final Dimens _dimens = Get.find();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(_routes.newsDetails),
      child: Stack(
        children: [
          Container(
            height: SizeConfig.heightMultiplier * 70,
            margin: EdgeInsets.only(
              right: _dimens.defaultMargin * 2,
            ),
            child: Material(
              borderRadius: BorderRadius.circular(_dimens.defaultRadius),
              clipBehavior: Clip.hardEdge,
              child: Image.asset(
                "assets/images/design.png",
                width: SizeConfig.widthMultiplier * 90,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(_dimens.defaultRadius),
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 10,
                  sigmaY: 10,
                ),
                child: Container(
                  height: SizeConfig.heightMultiplier * 25,
                  width: SizeConfig.widthMultiplier * 90,
                  decoration: BoxDecoration(
                    color: _colors.frostedBlack.withOpacity(.4),
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(_dimens.defaultRadius),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: _dimens.defaultPadding * 2,
                      vertical: _dimens.defaultPadding,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Expanded(
                          child: SizedBox(
                            height: 1,
                          ),
                        ),
                        OptimizedText(
                          _strings.lorem,
                          customColor: _colors.lightTxtColor,
                          textAlign: TextAlign.start,
                          maxLine: 2,
                          sizeOption: TextSizeOptions.body,
                          fontWeight: FontWeight.bold,
                        ),
                        const Expanded(
                          child: SizedBox(
                            height: 1,
                          ),
                        ),
                        OptimizedText(
                          _strings.lorem,
                          customColor: _colors.lightTxtColor,
                          textAlign: TextAlign.start,
                          maxLine: 3,
                          sizeOption: TextSizeOptions.caption,
                          fontWeight: FontWeight.w100,
                        ),
                        const Expanded(
                          child: SizedBox(
                            height: 1,
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  OptimizedText(
                                    "2 min read",
                                    customColor: _colors.lightTxtColor,
                                    textAlign: TextAlign.start,
                                    fontWeight: FontWeight.bold,
                                    sizeOption: TextSizeOptions.small,
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  OptimizedText(
                                    "5:12 PM",
                                    customColor: _colors.lightTxtColor,
                                    textAlign: TextAlign.start,
                                    fontWeight: FontWeight.w300,
                                    sizeOption: TextSizeOptions.small,
                                  ),
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () => Get.toNamed(_routes.barberProfile),
                              child: Material(
                                borderRadius: BorderRadius.circular(
                                    _dimens.defaultRadius * .5),
                                clipBehavior: Clip.hardEdge,
                                child: Image.asset(
                                  "assets/images/avatar.jpeg",
                                  width: 59,
                                  height: 59,
                                ),
                              ),
                            )
                          ],
                        ),
                        const Expanded(
                          child: SizedBox(
                            height: 1,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
