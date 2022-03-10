import 'package:barber_booking/app/core/values/colors.dart';
import 'package:barber_booking/app/core/values/dimes.dart';
import 'package:barber_booking/app/core/values/strings.dart';
import 'package:barber_booking/app/data/enums/text_size_option.dart';
import 'package:barber_booking/app/global_widgets/optimized_text.dart';
import 'package:barber_booking/app/modules/terms_conditions/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

class TermsConditionsPage extends StatelessWidget {
  TermsConditionsPage({Key? key}) : super(key: key);

  final AppColors _colors = Get.find();
  final Strings _strings = Get.find();
  final Dimens _dimens = Get.find();
  final TermsConditionsController _termsConditionsController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Obx(
        () => Visibility(
          visible: _termsConditionsController.showFab.value,
          maintainAnimation: true,
          maintainState: true,
          child: FloatingActionButton(
            backgroundColor: _colors.pastelCyan,
            hoverColor: _colors.frostedBlack,
            splashColor: _colors.frostedBlack.withOpacity(.3),
            onPressed: () {
              _termsConditionsController.scrollToTop();
            },
            child: const Icon(Ionicons.arrow_up),
          ),
        ),
      ),
      appBar: AppBar(
        title: Text(
          _strings.termsAndConditionsTitle,
        ),
      ),
      body: SingleChildScrollView(
        controller: _termsConditionsController.scrollController,
        child: Container(
          margin: EdgeInsets.only(bottom: _dimens.defaultMargin * 5),
          padding: EdgeInsets.symmetric(horizontal: _dimens.defaultPadding * 4),
          child: OptimizedText(
            _strings.termAndConditions,
            customColor: _colors.lightTxtColor,
            maxLine: 1000,
            textAlign: TextAlign.start,
            sizeOption: TextSizeOptions.caption,
          ),
        ),
      ),
    );
  }
}
