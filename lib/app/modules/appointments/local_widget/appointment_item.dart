import 'package:barber_booking/app/data/enums/text_color_option.dart';
import 'package:barber_booking/app/data/enums/text_size_option.dart';
import 'package:barber_booking/app/global_widgets/global_button.dart';
import 'package:barber_booking/app/global_widgets/optimized_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

import '../../../core/utils/size_config.dart';
import '../../../core/values/colors.dart';
import '../../../core/values/dimes.dart';
import '../../../core/values/strings.dart';
import '../../../routes/routes.dart';
import 'appointments_item_painter.dart';

class AppointmentsItem extends StatelessWidget {
  final bool isUpperWidget;

  AppointmentsItem({Key? key, required this.isUpperWidget}) : super(key: key);

  final Dimens _dimens = Get.find();
  final AppColors _colors = Get.find();
  final Routes _routes = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: SizeConfig.widthMultiplier * 100,
          height: 190,
          color: Colors.transparent,
          child: CustomPaint(
            painter: AppointmentsItemPainter(isUpperWidget: isUpperWidget),
            child: Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: _dimens.defaultPadding * 3),
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
                      margin: EdgeInsets.only(left: _dimens.defaultMargin * 2),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          titleWidget(),
                          SizedBox(
                            height: SizeConfig.heightMultiplier,
                          ),
                          workTimeWidget(),
                          SizedBox(
                            height: SizeConfig.heightMultiplier,
                          ),
                          locationWidget(),
                          SizedBox(
                            height: SizeConfig.heightMultiplier,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: GlobalButton(
                                child: const Text("Cancel"),
                                width: SizeConfig.widthMultiplier * 30,
                                color: _colors.pastelCyan,
                                onPressed: () {
                                  // todo : delete appointment from here
                                },
                                radius: _dimens.defaultRadius),
                          ),
                          SizedBox(
                            height: SizeConfig.heightMultiplier,
                          ),
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
    );
  }

  titleWidget() => OptimizedText(
        "XXXX Barbershop",
        colorOption: TextColorOptions.light,
        textAlign: TextAlign.start,
        fontWeight: FontWeight.bold,
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
