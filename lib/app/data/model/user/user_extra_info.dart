class UserExtraInfo {
  final int? gender;
  final int? age;

  UserExtraInfo({this.gender, this.age});

  factory UserExtraInfo.fromJson(doc) =>
      UserExtraInfo(age: doc["age"], gender: doc["gender"]);
}
