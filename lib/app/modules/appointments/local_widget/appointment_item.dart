import 'package:barber_booking/app/core/utils/distance_calculator.dart';
import 'package:barber_booking/app/data/enums/text_color_option.dart';
import 'package:barber_booking/app/data/model/appointments/appointments_item_data.dart';
import 'package:barber_booking/app/global_widgets/global_button.dart';
import 'package:barber_booking/app/global_widgets/optimized_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

import '../../../core/utils/size_config_helper.dart';
import '../../../core/values/colors.dart';
import '../../../core/values/dimes.dart';
import '../../../data/services/location_service.dart';
import '../../../routes/routes.dart';
import 'appointments_item_painter.dart';

class AppointmentsItem extends StatelessWidget {
  final AppointmentsItemModel data;

  AppointmentsItem({Key? key, required this.data}) : super(key: key);

  final Dimens _dimens = Get.find();
  final AppColors _colors = Get.find();
  final Routes _routes = Get.find();
  final CustomLocationService _customLocationService = Get.find();

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
            painter: AppointmentsItemPainter(isUpperWidget: data.isUpper),
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
        if (!data.isUpper) const SizedBox(height: 20),
      ],
    );
  }

  titleWidget() => OptimizedText(
        data.item.barberShopModel.title,
        colorOption: TextColorOptions.light,
        textAlign: TextAlign.start,
        fontWeight: FontWeight.bold,
      );

  workTimeWidget() => Row(
        children: [
          const Icon(
            Ionicons.time,
            size: 13,
          ),
          const SizedBox(
            width: 5,
          ),
          Text(data.item.appointmentTime),
        ],
      );

  locationWidget() => Row(
        children: [
          const Icon(
            Ionicons.location_outline,
            size: 15,
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            distanceBetweenTwoPoints(
                myLat: _customLocationService.userPosition.latitude,
                mylon: _customLocationService.userPosition.longitude,
                lat1: data.item.barberShopModel.lat,
                lon1: data.item.barberShopModel.long),
          ),
        ],
      );
}
