class BarberShop {
  final String title;
  final String subTitle;
  final List<String> tags;
  final String description;
  final double lat, long;

  BarberShop({
    required this.title,
    required this.subTitle,
    required this.tags,
    required this.description,
    required this.lat,
    required this.long,
  });

  factory BarberShop.fromJson(doc) => BarberShop(
      title: doc["title"],
      subTitle: doc["subTitle"],
      tags: doc["tags"],
      description: doc["description"],
      lat: double.parse(doc["lat"]),
      long: double.parse(doc["long"]));
}
