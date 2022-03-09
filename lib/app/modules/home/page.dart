import 'package:barber_booking/app/core/utils/size_config.dart';
import 'package:barber_booking/app/core/values/secret.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FlutterMap(
            options: MapOptions(
              center: LatLng(51.5, -0.09),
              zoom: 13.0,
            ),
            layers: [
              TileLayerOptions(
                urlTemplate: mapBoxUrl,
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
                    point: LatLng(51.5, -0.09),
                    builder: (ctx) => Container(
                      child: Icon(
                        Ionicons.accessibility,
                        color: _colors.springGreen,
                        size: SizeConfig.widthMultiplier * 10,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Align(alignment: Alignment.bottomCenter, child: CustomBottomNav()),
        ],
      ),
    );
  }
}
