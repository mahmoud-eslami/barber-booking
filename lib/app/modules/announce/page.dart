import 'package:barber_booking/app/core/utils/size_config_helper.dart';
import 'package:barber_booking/app/data/enums/text_color_option.dart';
import 'package:barber_booking/app/data/enums/text_size_option.dart';
import 'package:barber_booking/app/exports.dart';
import 'package:barber_booking/app/global_widgets/optimized_text.dart';
import 'package:barber_booking/app/modules/announce/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AnnouncePage extends StatelessWidget {
  AnnouncePage({Key? key, required this.cancelBooking}) : super(key: key);

  final bool cancelBooking;

  final Strings _strings = Get.find();
  final AnnounceController _announceController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OptimizedText(
              cancelBooking
                  ? _strings.bookingCanceledTitle
                  : _strings.bookedSuccessTitle,
              colorOption: TextColorOptions.light,
              sizeOption: TextSizeOptions.bigBody,
              fontWeight: FontWeight.bold,
            ),
            SizedBox(
              height: SizeConfig.heightMultiplier * 3,
            ),
            OptimizedText(
              cancelBooking ? _strings.cancelEmoji : _strings.successEmoji,
              colorOption: TextColorOptions.light,
              sizeOption: TextSizeOptions.bigBody,
            ),
          ],
        ),
      ),
    );
  }
}
