import 'package:barber_booking/app/core/utils/size_config.dart';
import 'package:barber_booking/app/core/values/dimes.dart';
import 'package:barber_booking/app/data/enums/text_color_option.dart';
import 'package:barber_booking/app/data/enums/text_size_option.dart';
import 'package:barber_booking/app/global_widgets/global_button.dart';
import 'package:barber_booking/app/global_widgets/optimized_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

import '../../core/values/colors.dart';
import '../../core/values/strings.dart';
import '../../routes/routes.dart';
import 'controller.dart';

class BarberShopProfile extends StatelessWidget {
  BarberShopProfile({Key? key}) : super(key: key);

  final AppColors _colors = Get.find();
  final Strings _strings = Get.find();
  final Routes _routes = Get.find();
  final Dimens _dimens = Get.find();
  final BarberShopProfileController _profileController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverAppBar(
                expandedHeight: 250.0,
                pinned: true,
                floating: true,
                backgroundColor: _colors.frostedBlack,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: Text(
                    "XXXXX Barbershop",
                    style: TextStyle(color: _colors.lightTxtColor),
                  ),
                  background: Stack(
                    children: [
                      Image.asset(
                        'assets/images/design.png',
                        fit: BoxFit.fill,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              _colors.frostedBlack,
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate([
                  BarberShopDescriptionWidget(),
                ]),
              ),
            ],
          ),
          SlideTransition(
            position: _profileController.slideBookButtonAnimation,
            child: FadeTransition(
              opacity: _profileController.fadeBookButtonAnimation,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: GlobalButton(
                  width: SizeConfig.widthMultiplier * 80,
                  height: _dimens.defaultButtonHeight,
                  child: OptimizedText("Booking"),
                  color: _colors.pastelCyan,
                  onPressed: () {},
                  radius: _dimens.defaultRadius,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BarberShopDescriptionWidget extends StatelessWidget {
  BarberShopDescriptionWidget({Key? key}) : super(key: key);

  final AppColors _colors = Get.find();
  final Strings _strings = Get.find();
  final Routes _routes = Get.find();
  final Dimens _dimens = Get.find();
  final BarberShopProfileController _profileController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(_dimens.defaultPadding * 3),
      child: Column(
        children: [
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
                          "USA - new street in somewhere that is exist !",
                          colorOption: TextColorOptions.light,
                          textAlign: TextAlign.start,
                          sizeOption: TextSizeOptions.caption,
                          maxLine: 2,
                        ),
                        ratingWidget(),
                      ],
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
          tagsWidget(),
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

  ratingWidget() => Row(
        children: [
          for (int i = 0; i < 5; i++)
            Icon(
              Ionicons.star,
              color: _colors.starColor,
              size: 12,
            ),
          const SizedBox(
            width: 5,
          ),
          const Text("37 ratings")
        ],
      );

  likeButton() => Container(
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
