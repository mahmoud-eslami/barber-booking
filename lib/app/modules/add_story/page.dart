import 'package:barber_booking/app/core/values/strings.dart';
import 'package:barber_booking/app/modules/add_story/controller.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/values/colors.dart';
import '../../core/values/dimes.dart';

class AddStory extends StatelessWidget {
  AddStory({Key? key}) : super(key: key);

  final AppColors _colors = Get.find();
  final Strings _strings = Get.find();
  final Dimens _dimens = Get.find();
  final AddStoryController _addStoryController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_strings.addStoryAppBarTitle),
      ),
      body: Obx(
        () {
          final scale = 1 /
              (_addStoryController.cameraController.value.aspectRatio *
                  MediaQuery.of(context).size.aspectRatio);

          return !_addStoryController.cameraInitialized.value
              ? Center(child: CircularProgressIndicator())
              : Transform.scale(
                  scale: scale,
                  child: CameraPreview(_addStoryController.cameraController),
                );
        },
      ),
    );
  }
}
