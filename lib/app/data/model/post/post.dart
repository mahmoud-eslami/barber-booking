import 'package:barber_booking/app/data/model/barber/barber.dart';

class PostModel {
  final String title;
  final String description;
  final String image;
  final String releaseTime;
  final String timeToRead;
  final BarberModel barber;

  PostModel({
    required this.title,
    required this.description,
    required this.image,
    required this.releaseTime,
    required this.timeToRead,
    required this.barber,
  });

  factory PostModel.fromJson({required doc, required barberData}) => PostModel(
        title: doc["title"],
        description: doc["description"],
        image: doc["image"],
        releaseTime: doc["releaseTime"],
        timeToRead: doc["timeToRead"],
        barber: BarberModel.fromJson(barberData),
      );
}
