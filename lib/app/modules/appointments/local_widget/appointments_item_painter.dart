import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/values/colors.dart';
import '../../../core/values/dimes.dart';

class AppointmentsItemPainter extends CustomPainter {
  final bool isUpperWidget;

  final AppColors _colors = Get.find();
  final Dimens _dimens = Get.find();

  AppointmentsItemPainter({required this.isUpperWidget});

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    var path = Path();
    paint
      ..color = _colors.lightBorder.withOpacity(.1)
      ..style = PaintingStyle.fill;

    const radiusStop = 30.0;

    if (isUpperWidget) {
      path.moveTo(0, radiusStop);
      path.quadraticBezierTo(0, 0, size.width * .1, 0);
      path.lineTo(size.width * .9, 0);
      path.quadraticBezierTo(size.width, 0, size.width * 1, radiusStop);
      path.lineTo(size.width, size.height * .75);
      path.quadraticBezierTo(size.width, size.height * .90,
          size.width - radiusStop, size.height * .90);
      path.lineTo(radiusStop, size.height);
      path.quadraticBezierTo(0, size.height, 0, size.height - radiusStop);
    } else {
      path.moveTo(size.width, size.height - radiusStop);
      path.quadraticBezierTo(
          size.width, size.height, size.width - radiusStop, size.height);
      path.lineTo(radiusStop, size.height);
      path.quadraticBezierTo(0, size.height, 0, size.height - radiusStop);
      path.lineTo(0, size.height * .25);
      path.quadraticBezierTo(0, size.height * .1, radiusStop, size.height * .1);
      path.lineTo(size.width - radiusStop, 0);
      path.quadraticBezierTo(size.width, 0, size.width, radiusStop);
    }
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
