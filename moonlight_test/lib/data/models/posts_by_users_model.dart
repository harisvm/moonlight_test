import 'dart:convert';

///posts done by each users are received in this model
List<PostByUsersModel> postByUsersModelFromMap(String str) =>
    List<PostByUsersModel>.from(
        json.decode(str).map((x) => PostByUsersModel.fromMap(x)));

String postByUsersModelToMap(List<PostByUsersModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class PostByUsersModel {
  PostByUsersModel({
    this.userId,
    this.id,
    this.title,
    this.body,
  });

  int userId;
  int id;
  String title;
  String body;

  factory PostByUsersModel.fromMap(Map<String, dynamic> json) =>
      PostByUsersModel(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
      );

  Map<String, dynamic> toMap() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
      };
}
