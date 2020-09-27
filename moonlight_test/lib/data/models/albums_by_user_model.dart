import 'dart:convert';
///album details of each users are received in this model
List<AlbumsByUserModel> albumsByUserModelFromMap(String str) =>
    List<AlbumsByUserModel>.from(
        json.decode(str).map((x) => AlbumsByUserModel.fromMap(x)));

String albumsByUserModelToMap(List<AlbumsByUserModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class AlbumsByUserModel {
  AlbumsByUserModel({
    this.userId,
    this.id,
    this.title,
  });

  int userId;
  int id;
  String title;

  factory AlbumsByUserModel.fromMap(Map<String, dynamic> json) =>
      AlbumsByUserModel(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
      );

  Map<String, dynamic> toMap() => {
        "userId": userId,
        "id": id,
        "title": title,
      };
}
