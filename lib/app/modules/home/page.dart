import 'package:barber_booking/app/core/utils/size_config.dart';
import 'package:barber_booking/app/core/values/secret.dart';
import 'package:barber_booking/app/global_widgets/global_indicator.dart';
import 'package:barber_booking/app/modules/home/controller.dart';
import 'package:barber_booking/app/modules/home/local_widget/custom_bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
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
                    markers: [
                      Marker(
                        width: 80.0,
                        height: 80.0,
                        point: LatLng(
                          _homeController.userPosition.latitude,
                          _homeController.userPosition.longitude,
                        ),
                        builder: (ctx) => Icon(
                          Ionicons.location,
                          color: _colors.pastelCyan,
                          size: SizeConfig.widthMultiplier * 10,
                        ),
                      ),
                    ],
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
