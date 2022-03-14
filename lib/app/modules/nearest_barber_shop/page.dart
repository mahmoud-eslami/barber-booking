import 'package:barber_booking/app/core/utils/size_config.dart';
import 'package:barber_booking/app/core/values/dimes.dart';
import 'package:barber_booking/app/data/enums/text_color_option.dart';
import 'package:barber_booking/app/data/enums/text_size_option.dart';
import 'package:barber_booking/app/global_widgets/optimized_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

import '../../core/values/colors.dart';
import '../../core/values/strings.dart';
import '../../routes/routes.dart';

class NearestBarberShop extends StatelessWidget {
  NearestBarberShop({Key? key}) : super(key: key);

  final AppColors _colors = Get.find();
  final Strings _strings = Get.find();
  final Routes _routes = Get.find();
  final Dimens _dimens = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: _dimens.defaultPadding * 2),
        child: Column(
          children: [
            NearBarberShopSearchBar(),
            SizedBox(
              height: SizeConfig.heightMultiplier * 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: OptimizedText(
                    "Search results",
                    colorOption: TextColorOptions.light,
                    textAlign: TextAlign.start,
                    fontWeight: FontWeight.bold,
                    sizeOption: TextSizeOptions.bigBody,
                  ),
                ),
                Expanded(
                  child: OptimizedText(
                    "14 results",
                    colorOption: TextColorOptions.light,
                    textAlign: TextAlign.end,
                    sizeOption: TextSizeOptions.caption,
                  ),
                ),
              ],
            ),
            BarberShopsItems(),
          ],
        ),
      ),
    );
  }
}

class NearBarberShopSearchBar extends StatelessWidget {
  NearBarberShopSearchBar({Key? key}) : super(key: key);

  final AppColors _colors = Get.find();
  final Strings _strings = Get.find();
  final Routes _routes = Get.find();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: const InputDecoration(
          prefixIcon: Icon(Ionicons.search),
          label: Text("Barber shop"),
          contentPadding: EdgeInsets.zero,
          floatingLabelAlignment: FloatingLabelAlignment.start),
    );
  }
}

class BarberShopsItems extends StatelessWidget {
  BarberShopsItems({Key? key}) : super(key: key);

  final Dimens _dimens = Get.find();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        padding: EdgeInsets.only(top: _dimens.defaultPadding * 3),
        itemCount: 10,
        itemBuilder: (context, index) =>
            BarberShopItem(isUpperWidget: (index % 2 == 0)),
      ),
    );
  }
}

class BarberShopItem extends StatelessWidget {
  final bool isUpperWidget;

  BarberShopItem({Key? key, required this.isUpperWidget}) : super(key: key);

  final AppColors _colors = Get.find();
  final Strings _strings = Get.find();
  final Routes _routes = Get.find();
  final Dimens _dimens = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: SizeConfig.widthMultiplier * 100,
          height: 200,
          color: Colors.transparent,
          child: CustomPaint(
            painter: BarberShopItemPainter(isUpperWidget: isUpperWidget),
          ),
        ),
        if (!isUpperWidget) const SizedBox(height: 30),
      ],
    );
  }
}

class BarberShopItemPainter extends CustomPainter {
  final bool isUpperWidget;

  final AppColors _colors = Get.find();

  BarberShopItemPainter({required this.isUpperWidget});

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    var path = Path();
    paint
      ..color = _colors.coloredBorder
      ..style = PaintingStyle.fill;

    if (isUpperWidget) {
      path.moveTo(0, 0);
      path.lineTo(size.width, 0);
      path.lineTo(size.width, size.height);
      path.lineTo(size.width, size.height * .85);
      path.lineTo(0, size.height);
    } else {
      path.moveTo(0, size.height);
      path.lineTo(size.width, size.height);
      path.lineTo(size.width, 0);
      path.lineTo(0, size.height * .15);
    }
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
