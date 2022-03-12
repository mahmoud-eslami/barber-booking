import 'package:barber_booking/app/core/utils/size_config.dart';
import 'package:barber_booking/app/data/enums/text_size_option.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/values/colors.dart';
import '../../../core/values/dimes.dart';
import '../../../core/values/strings.dart';
import '../../../data/enums/text_color_option.dart';
import '../../../global_widgets/optimized_text.dart';
import '../../../routes/routes.dart';
import '../controller.dart';

class AgeSelector extends StatelessWidget {
  AgeSelector({Key? key}) : super(key: key);

  final AppColors _colors = Get.find();
  final Strings _strings = Get.find();
  final Routes _routes = Get.find();
  final Dimens _dimens = Get.find();
  final ProfileController _profileController = Get.find();

  @override
  Widget build(BuildContext context) {
    const duration = Duration(milliseconds: 300);
    return Column(
      children: [
        OptimizedText(
          "How old are you ?",
          colorOption: TextColorOptions.light,
          sizeOption: TextSizeOptions.body,
          fontWeight: FontWeight.bold,
        ),
        SizedBox(
          height: SizeConfig.heightMultiplier * 1,
        ),
        Container(
          height: _dimens.defaultButtonHeight,
          margin: EdgeInsets.symmetric(vertical: _dimens.defaultMargin),
          padding: EdgeInsets.only(
            right: _dimens.defaultPadding * .5,
          ),
          decoration: BoxDecoration(
            color: _colors.lightBorder,
            borderRadius: BorderRadius.circular(
              _dimens.defaultRadius,
            ),
          ),
          child: ListView.builder(
            padding: EdgeInsets.only(
              left: ((SizeConfig.widthMultiplier * 100) -
                      (_dimens.defaultPadding * 9)) *
                  .5,
              right: ((SizeConfig.widthMultiplier * 100) -
                      (_dimens.defaultPadding * 9)) *
                  .4,
            ),
            controller: _profileController.ageSelectorScrollController,
            scrollDirection: Axis.horizontal,
            itemCount: 80,
            itemBuilder: (context, index) {
              return Obx(
                () {
                  bool isSelected =
                      (_profileController.selectedAgeIndex.value == index);
                  return Center(
                    child: Padding(
                      padding:
                          EdgeInsets.only(right: _dimens.defaultPadding * 4),
                      child: Text(
                        "${index + 5}",
                        style: TextStyle(
                          fontSize: isSelected ? 35 : 30,
                          fontWeight:
                              isSelected ? FontWeight.bold : FontWeight.normal,
                          color: isSelected
                              ? _colors.pastelCyan
                              : _colors.lightTxtColor.withOpacity(.4),
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
