import 'package:barber_booking/app/data/enums/news_state.dart';
import 'package:barber_booking/app/data/enums/text_size_option.dart';
import 'package:barber_booking/app/global_widgets/global_indicator.dart';
import 'package:barber_booking/app/global_widgets/optimized_text.dart';
import 'package:barber_booking/app/global_widgets/parent_widget.dart';
import 'package:barber_booking/app/modules/news/controller.dart';
import 'package:barber_booking/app/modules/news/local_widget/news_line.dart';
import 'package:barber_booking/app/modules/news/local_widget/stories_line.dart';
import 'package:barber_booking/app/modules/news/local_widget/trends_line.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/values/colors.dart';
import '../../core/values/dimes.dart';
import '../../core/values/strings.dart';
import '../../routes/routes.dart';

class NewsPage extends StatelessWidget {
  NewsPage({Key? key}) : super(key: key);

  final AppColors _colors = Get.find();
  final Strings _strings = Get.find();
  final Routes _routes = Get.find();
  final Dimens _dimens = Get.find();
  final NewsController _newsController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_strings.newsPageTitle),
      ),
      body: ParentWidget(
        child: Obx(
          () => _newsController.pageState.value == NewsState.loadingStories
              ? GlobalIndicator(
                  color: _colors.pastelCyan,
                )
              : Column(
                  children: [
                    FadeTransition(
                      opacity: _newsController.storyLineFadeAnimation,
                      child: SlideTransition(
                        position: _newsController.storyLineSlideAnimation,
                        child: StoriesLine(),
                      ),
                    ),
                    FadeTransition(
                      opacity: _newsController.newsTitleFadeAnimation,
                      child: SlideTransition(
                        position: _newsController.newsTitleSlideAnimation,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: _dimens.defaultPadding * 2,
                            vertical: _dimens.defaultPadding,
                          ),
                          child: OptimizedText(
                            _strings.barberShopNewsTitle,
                            customColor: _colors.lightTxtColor,
                            textAlign: TextAlign.left,
                            fontWeight: FontWeight.bold,
                            sizeOption: TextSizeOptions.bigBody,
                          ),
                        ),
                      ),
                    ),
                    FadeTransition(
                      opacity: _newsController.newsLineFadeAnimation,
                      child: SlideTransition(
                        position: _newsController.newsLineSlideAnimation,
                        child: NewsLine(),
                      ),
                    ),
                    FadeTransition(
                      opacity: _newsController.trendTitleFadeAnimation,
                      child: SlideTransition(
                        position: _newsController.trendTitleSlideAnimation,
                        child: Padding(
                          padding: EdgeInsets.all(_dimens.defaultPadding * 2),
                          child: OptimizedText(
                            _strings.trendingBarberTitle,
                            customColor: _colors.lightTxtColor,
                            textAlign: TextAlign.left,
                            fontWeight: FontWeight.bold,
                            sizeOption: TextSizeOptions.bigBody,
                          ),
                        ),
                      ),
                    ),
                    FadeTransition(
                      opacity: _newsController.trendLineFadeAnimation,
                      child: SlideTransition(
                          position: _newsController.trendLineSlideAnimation,
                          child: TrendsLine()),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
