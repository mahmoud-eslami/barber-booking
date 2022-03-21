import 'package:barber_booking/app/core/values/secret.dart';
import 'package:barber_booking/app/global_widgets/global_indicator.dart';
import 'package:barber_booking/app/modules/home/controller.dart';
import 'package:barber_booking/app/modules/home/local_widget/custom_bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import "package:latlong2/latlong.dart";

import '../../core/values/colors.dart';
import '../../core/values/strings.dart';
import '../../routes/routes.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final AppColors _colors = Get.find();
  final Strings _strings = Get.find();
  final Routes _routes = Get.find();
  final HomeController _homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Obx(
            () {
              if (_homeController.getLocationLoading.value) {
                return const GlobalIndicator();
              }
              return FlutterMap(
                mapController: _homeController.mapController,
                options: MapOptions(
                  center: LatLng(
                    _homeController.userPosition.latitude,
                    _homeController.userPosition.longitude,
                  ),
                  zoom: 13.0,
                ),
                layers: [
                  TileLayerOptions(
                    urlTemplate: darkMapUrl,
                    subdomains: ['a', 'b', 'c'],
                    attributionBuilder: (_) {
                      return Container();
                    },
                  ),
                  MarkerLayerOptions(
                    markers: _homeController.markers.toList(),
                  ),
                ],
              );
            },
          ),
          Align(alignment: Alignment.bottomCenter, child: CustomBottomNav()),
        ],
      ),
    );
  }
}
