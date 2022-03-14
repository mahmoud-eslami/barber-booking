import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/utils/size_config.dart';
import '../../../core/values/colors.dart';
import '../../../core/values/dimes.dart';
import '../../../core/values/strings.dart';
import 'barber_shop_item_painter.dart';

class BarberShopItem extends StatelessWidget {
  final bool isUpperWidget;

  BarberShopItem({Key? key, required this.isUpperWidget}) : super(key: key);

  final Dimens _dimens = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: SizeConfig.widthMultiplier * 100,
          height: 190,
          color: Colors.transparent,
          child: CustomPaint(
            painter: BarberShopItemPainter(isUpperWidget: isUpperWidget),
            child: Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: _dimens.defaultPadding * 3),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Material(
                    borderRadius:
                        BorderRadius.circular(_dimens.defaultRadius * .4),
                    clipBehavior: Clip.hardEdge,
                    child: Image.asset(
                      "assets/images/design.png",
                      height: 130,
                      width: 90,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        if (!isUpperWidget) const SizedBox(height: 20),
      ],
    );
  }
}
