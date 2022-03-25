import 'package:barber_booking/app/core/utils/size_config_helper.dart';
import 'package:barber_booking/app/core/values/dimes.dart';
import 'package:barber_booking/app/global_widgets/global_button.dart';
import 'package:barber_booking/app/global_widgets/optimized_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/values/colors.dart';
import '../../core/values/strings.dart';
import '../../routes/routes.dart';
import 'controller.dart';
import 'local_widget/barber_description.dart';

class BarberProfile extends StatelessWidget {
  BarberProfile({Key? key}) : super(key: key);

  final AppColors _colors = Get.find();
  final Strings _strings = Get.find();
  final Routes _routes = Get.find();
  final Dimens _dimens = Get.find();
  final BarberProfileController _profileController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverAppBar(
                expandedHeight: 250.0,
                pinned: true,
                floating: true,
                backgroundColor: _colors.frostedBlack,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: Text(
                    "XXXXX Barbershop",
                    style: TextStyle(color: _colors.lightTxtColor),
                  ),
                  background: Stack(
                    children: [
                      Image.asset(
                        'assets/images/avatar.jpeg',
                        width: SizeConfig.widthMultiplier * 100,
                        fit: BoxFit.cover,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              _colors.frostedBlack,
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate([
                  BarberDescriptionWidget(),
                ]),
              ),
            ],
          ),
          SlideTransition(
            position: _profileController.slideBookButtonAnimation,
            child: FadeTransition(
              opacity: _profileController.fadeBookButtonAnimation,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: GlobalButton(
                  width: SizeConfig.widthMultiplier * 80,
                  height: _dimens.defaultButtonHeight,
                  child: OptimizedText("Booking"),
                  color: _colors.pastelCyan,
                  onPressed: () {},
                  radius: _dimens.defaultRadius,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
