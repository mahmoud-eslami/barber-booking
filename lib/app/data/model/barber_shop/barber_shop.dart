class BarberShopModel {
  final String title;
  final String subTitle;
  final List<String> tags;
  final String description;
  final double lat, long;
  final String imageUrl;
  final String startWorkTime, endWorkTime;

  BarberShopModel({
    required this.title,
    required this.subTitle,
    required this.tags,
    required this.description,
    required this.lat,
    required this.long,
    required this.imageUrl,
    required this.startWorkTime,
    required this.endWorkTime,
  });

  factory BarberShopModel.fromJson(doc) => BarberShopModel(
        title: doc["title"],
        subTitle: doc["subTitle"],
        tags: converTagsToStringList(doc["tags"]),
        description: doc["description"],
        lat: double.parse(doc["lat"]),
        long: double.parse(doc["long"]),
        imageUrl: doc["image"],
        startWorkTime: doc["startWorkTime"],
        endWorkTime: doc["endWorkTime"],
      );

  static converTagsToStringList(List<dynamic> list) {
    List<String> stringList = [];

    for (var element in list) {
      stringList.add(element.toString());
    }

    return stringList;
  }
}
