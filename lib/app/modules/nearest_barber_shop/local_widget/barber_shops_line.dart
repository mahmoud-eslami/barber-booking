
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/values/dimes.dart';
import 'barber_shop_item.dart';

class BarberShopsItemsList extends StatelessWidget {
  BarberShopsItemsList({Key? key}) : super(key: key);

  final Dimens _dimens = Get.find();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        padding: EdgeInsets.only(top: _dimens.defaultPadding * 3),
        itemCount: 10,
        itemBuilder: (context, index) =>
            BarberShopItem(isUpperWidget: (index % 2 == 0)),
      ),
    );
  }
}
