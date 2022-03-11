import 'package:barber_booking/app/modules/news/local_widget/add_story.dart';
import 'package:barber_booking/app/modules/news/local_widget/stories_line.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("News"),
      ),
      body: Column(
        children: [
          StoriesLine(),
        ],
      ),
    );
  }
}
