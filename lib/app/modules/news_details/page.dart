import 'package:barber_booking/app/core/utils/size_config_helper.dart';
import 'package:barber_booking/app/exports.dart';
import 'package:barber_booking/app/modules/news_details/controller.dart';
import 'package:barber_booking/app/modules/news_details/local_widget/news_details_description.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/model/post/post.dart';

class NewsDetailsPage extends StatelessWidget {
  NewsDetailsPage({Key? key, required this.item}) : super(key: key);

  final PostModel item;

  final AppColors _colors = Get.find();
  final Strings _strings = Get.find();
  final Routes _routes = Get.find();
  final Dimens _dimens = Get.find();
  final NewsDetailsController _profileController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 250.0,
            pinned: true,
            floating: true,
            backgroundColor: _colors.frostedBlack,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                children: [
                  ExtendedImage.network(
                    item.image,
                    fit: BoxFit.cover,
                    width: SizeConfig.widthMultiplier * 100,
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
              NewsDetailsDescription(item: item),
            ]),
          ),
        ],
      ),
    );
  }
}
