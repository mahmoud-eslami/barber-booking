import 'package:barber_booking/app/core/utils/size_config_helper.dart';
import 'package:barber_booking/app/core/values/dimes.dart';
import 'package:barber_booking/app/data/enums/pages_states/profile_state.dart';
import 'package:barber_booking/app/global_widgets/global_button.dart';
import 'package:barber_booking/app/global_widgets/global_form_field.dart';
import 'package:barber_booking/app/global_widgets/global_indicator.dart';
import 'package:barber_booking/app/global_widgets/optimized_text.dart';
import 'package:barber_booking/app/global_widgets/parent_widget.dart';
import 'package:barber_booking/app/modules/profile/local_widget/gender_selector.dart';
import 'package:barber_booking/app/modules/profile/local_widget/profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

import '../../core/values/colors.dart';
import '../../core/values/strings.dart';
import '../../routes/routes.dart';
import 'controller.dart';

// todo : create custom document for store gender and age

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
        child: Obx(
          () {
            bool isLoading = _profileController.pageState.value ==
                ProfileState.loadingToGetData;
            return isLoading
                ? const Center(child: GlobalIndicator())
                : ParentWidget(
                    child: Column(
                      children: [
                        SizedBox(
                          height: SizeConfig.heightMultiplier * 4,
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
                          height: SizeConfig.heightMultiplier * 5,
                        ),
                        FadeTransition(
                          opacity: _profileController.fieldFadeAnimation1,
                          child: SlideTransition(
                            position: _profileController.fieldAnimation1,
                            child: GlobalTextFormField(
                              controller: _profileController.nameController,
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
                              controller: _profileController.emailController,
                              label: _strings.emailHint,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: SizeConfig.heightMultiplier * 1,
                        ),
                        FadeTransition(
                          opacity: _profileController.ageFieldFadeAnimation,
                          child: SlideTransition(
                            position: _profileController.ageFieldAnimation,
                            child: GlobalTextFormField(
                              controller: _profileController.ageController,
                              label: _strings.ageHint,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: SizeConfig.heightMultiplier * 2,
                        ),
                        FadeTransition(
                          opacity:
                              _profileController.genderSelectorFadeAnimation,
                          child: SlideTransition(
                            position:
                                _profileController.genderSelectorAnimation,
                            child: GenderSelector(),
                          ),
                        ),
                        SizedBox(
                          height: SizeConfig.heightMultiplier * 4,
                        ),
                        FadeTransition(
                          opacity: _profileController.buttonFadeAnimation,
                          child: SlideTransition(
                            position: _profileController.buttonAnimation,
                            child: GlobalButton(
                              child: Obx(
                                () => _profileController.pageState.value ==
                                        ProfileState.loadingToSubmitData
                                    ? GlobalIndicator(
                                        color: _colors.frostedBlack,
                                      )
                                    : OptimizedText(
                                        _strings.profileSubmitBtn,
                                        fontWeight: FontWeight.bold,
                                      ),
                              ),
                              color: _colors.pastelCyan,
                              onPressed: () {
                                _profileController.updateProfile(
                                  email:
                                      _profileController.emailController.text,
                                  name: _profileController.nameController.text,
                                );
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
                  );
          },
        ),
      ),
    );
  }
}
