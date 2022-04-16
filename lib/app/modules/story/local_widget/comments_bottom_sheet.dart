import 'package:barber_booking/app/global_widgets/global_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/values/colors.dart';
import '../../../core/values/dimes.dart';
import '../../../core/values/strings.dart';
import '../../../global_widgets/bottom_sheet_line.dart';

class CommentsBottomSheet extends StatelessWidget {
  CommentsBottomSheet({Key? key}) : super(key: key);

  final AppColors _colors = Get.find();
  final Strings _strings = Get.find();
  final Dimens _dimens = Get.find();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Padding(
        padding: EdgeInsets.all(_dimens.defaultPadding),
        child: Stack(
          children: [
            Align(alignment: Alignment.topCenter, child: BottomSheetLine()),
            Column(
              children: [
                GlobalTextFormField(
                    controller: TextEditingController(), label: "Comment"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
