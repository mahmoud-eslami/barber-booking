import 'package:barber_booking/app/data/enums/text_color_option.dart';
import 'package:barber_booking/app/data/enums/text_size_option.dart';
import 'package:barber_booking/app/global_widgets/optimized_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

import '../../../core/utils/size_config.dart';
import '../../../core/values/colors.dart';
import '../../../core/values/dimes.dart';
import '../../../core/values/strings.dart';
import '../../../routes/routes.dart';
import 'barber_shop_item_painter.dart';

class BarberShopItem extends StatelessWidget {
  final bool isUpperWidget;

  BarberShopItem({Key? key, required this.isUpperWidget}) : super(key: key);

  final Dimens _dimens = Get.find();
  final AppColors _colors = Get.find();
  final Routes _routes = Get.find();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(_routes.barberShopProfile),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: SizeConfig.widthMultiplier * 100,
            height: 190,
            color: Colors.transparent,
            child: CustomPaint(
              painter: BarberShopItemPainter(isUpperWidget: isUpperWidget),
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: _dimens.defaultPadding * 3),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
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
                    Expanded(
                      child: Container(
                        margin:
                            EdgeInsets.only(left: _dimens.defaultMargin * 2),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            titleWidget(),
                            SizedBox(
                              height: SizeConfig.heightMultiplier * 2,
                            ),
                            Row(
                              children: [
                                openStatusWidget(),
                                SizedBox(
                                  width: SizeConfig.widthMultiplier * 4,
                                ),
                                workTimeWidget(),
                              ],
                            ),
                            SizedBox(
                              height: SizeConfig.heightMultiplier,
                            ),
                            ratingWidget(),
                            SizedBox(
                              height: SizeConfig.heightMultiplier,
                            ),
                            separatorWidget(),
                            SizedBox(
                              height: SizeConfig.heightMultiplier,
                            ),
                            locationWidget(),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          if (!isUpperWidget) const SizedBox(height: 20),
        ],
      ),
    );
  }

  separatorWidget() => Row(
        children: [
          Container(
            width: 50,
            height: 2,
            decoration: BoxDecoration(
              color: _colors.pastelCyan,
              borderRadius: BorderRadius.circular(
                _dimens.defaultRadius,
              ),
            ),
          ),
        ],
      );

  titleWidget() => OptimizedText(
        "XXXX Barbershop",
        colorOption: TextColorOptions.light,
        textAlign: TextAlign.start,
        fontWeight: FontWeight.bold,
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

  openStatusWidget() => Row(
        children: [
          Container(
            width: 10,
            height: 10,
            decoration: BoxDecoration(
              color: _colors.pastelCyan,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          const Text("Open")
        ],
      );

  workTimeWidget() => Row(
        children: const [
          Icon(
            Ionicons.time,
            size: 13,
          ),
          SizedBox(
            width: 5,
          ),
          Text("10:00 - 21:00"),
        ],
      );

  locationWidget() => Row(
        children: const [
          Icon(
            Ionicons.location_outline,
            size: 15,
          ),
          SizedBox(
            width: 5,
          ),
          Text("1.2 kilometers away"),
        ],
      );
}
