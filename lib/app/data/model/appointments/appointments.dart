import 'package:barber_booking/app/data/model/barber_shop/barber_shop.dart';

class AppointmentsModel {
  final BarberShopModel barberShopModel;
  final String appointmentTime;

  AppointmentsModel({
    required this.barberShopModel,
    required this.appointmentTime,
  });

  factory AppointmentsModel.fromJson(doc) => AppointmentsModel(
        barberShopModel: BarberShopModel.fromJson(doc["barberShop"]),
        appointmentTime: doc["appointmentTime"],
      );
}
