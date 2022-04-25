class BarberModel {
  final String name;
  final String location;
  final String description;
  final String image;

  BarberModel({
    required this.name,
    required this.image,
    required this.location,
    required this.description,
  });

  factory BarberModel.fromJson(doc) => BarberModel(
        image: doc["image"],
        name: doc["name"],
        location: doc["location"],
        description: doc["description"],
      );
}
