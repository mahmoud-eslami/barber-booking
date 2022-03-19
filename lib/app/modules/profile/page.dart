import 'package:barber_booking/app/core/utils/size_config.dart';
import 'package:barber_booking/app/core/values/dimes.dart';
import 'package:barber_booking/app/global_widgets/global_button.dart';
import 'package:barber_booking/app/global_widgets/global_form_field.dart';
import 'package:barber_booking/app/global_widgets/optimized_text.dart';
import 'package:barber_booking/app/modules/profile/local_widget/age_selector.dart';
import 'package:barber_booking/app/modules/profile/local_widget/gender_selector.dart';
import 'package:barber_booking/app/modules/profile/local_widget/profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

import '../../core/values/colors.dart';
import '../../core/values/strings.dart';
import '../../routes/routes.dart';
import 'controller.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({Key? key}) : super(key: key);

  final AppColors _colors = Get.find();
  final Strings _strings = Get.find();
  final Routes _routes = Get.find();
  final Dimens _dimens = Get.find();
  final ProfileController _profileController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _strings.profileTitle,
        ),
        actions: [
          IconButton(
            onPressed: () {
              _profileController.logout();
            },
            icon: Icon(
              Ionicons.log_out_outline,
              size: _dimens.defaultIconSize * 1.2,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: _dimens.defaultPadding * 4,
        ),
        child: Column(
          children: [
            SizedBox(
              height: SizeConfig.heightMultiplier * 5,
            ),
            Center(
              child: FadeTransition(
                opacity: _profileController.avatarFadeAnimation,
                child: SlideTransition(
                  position: _profileController.avatarAnimation,
                  child: ProfileAvatar(),
                ),
              ),
            ),
            SizedBox(
              height: SizeConfig.heightMultiplier * 4,
            ),
            FadeTransition(
              opacity: _profileController.fieldFadeAnimation1,
              child: SlideTransition(
                position: _profileController.fieldAnimation1,
                child: GlobalTextFormField(
                  controller: TextEditingController(),
                  label: _strings.nameHint,
                ),
              ),
            ),
            SizedBox(
              height: SizeConfig.heightMultiplier * 1,
            ),
            FadeTransition(
              opacity: _profileController.fieldFadeAnimation2,
              child: SlideTransition(
                position: _profileController.fieldAnimation2,
                child: GlobalTextFormField(
                  controller: TextEditingController(),
                  label: _strings.emailHint,
                ),
              ),
            ),
            SizedBox(
              height: SizeConfig.heightMultiplier * 1,
            ),
            FadeTransition(
              opacity: _profileController.genderSelectorFadeAnimation,
              child: SlideTransition(
                position: _profileController.genderSelectorAnimation,
                child: GenderSelector(),
              ),
            ),
            SizedBox(
              height: SizeConfig.heightMultiplier * 1,
            ),
            FadeTransition(
              opacity: _profileController.ageSelectorFadeAnimation,
              child: SlideTransition(
                position: _profileController.ageSelectorAnimation,
                child: AgeSelector(),
              ),
            ),
            SizedBox(
              height: SizeConfig.heightMultiplier * 1,
            ),
            const Expanded(
              child: SizedBox(
                height: 1,
              ),
            ),
            FadeTransition(
              opacity: _profileController.buttonFadeAnimation,
              child: SlideTransition(
                position: _profileController.buttonAnimation,
                child: GlobalButton(
                  child: OptimizedText(
                    _strings.profileSubmitBtn,
                    fontWeight: FontWeight.bold,
                  ),
                  color: _colors.pastelCyan,
                  onPressed: () {
                    Get.back();
                  },
                  height: _dimens.defaultButtonHeight,
                  radius: _dimens.defaultRadius,
                ),
              ),
            ),
            SizedBox(
              height: SizeConfig.heightMultiplier * 4,
            ),
          ],
        ),
      ),
    );
  }
}
