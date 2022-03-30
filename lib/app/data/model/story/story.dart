class StoryModel {
  final String thumbnail;
  final String image;
  final String id;
  final List<String> comments;
  final List<String> likes;
  final List<String> seens;

  StoryModel({
    required this.thumbnail,
    required this.image,
    required this.id,
    required this.comments,
    required this.likes,
    required this.seens,
  });

  factory StoryModel.fromJson(doc) => StoryModel(
        thumbnail: doc["thumbnail"],
        image: doc["image"],
        id: doc["id"],
        comments: converDynamicListToStringList(doc["comments"]),
        likes: converDynamicListToStringList(doc["likes"]),
        seens: converDynamicListToStringList(doc["seens"]),
      );

  static converDynamicListToStringList(List<dynamic> list) {
    List<String> stringList = [];

    for (var element in list) {
      stringList.add(element.toString());
    }

    return stringList;
  }
}
