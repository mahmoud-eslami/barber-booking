class BarberModel {
  final String name;
  final String location;
  final String description;

  BarberModel({
    required this.name,
    required this.location,
    required this.description,
  });

  factory BarberModel.fromJson(doc) => BarberModel(
        name: doc["name"],
        location: doc["location"],
        description: doc["description"],
      );
}
