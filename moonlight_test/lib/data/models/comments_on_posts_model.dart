// To parse this JSON data, do
//
//     final commentsOnPostsModel = commentsOnPostsModelFromMap(jsonString);

import 'dart:convert';

List<CommentsOnPostsModel> commentsOnPostsModelFromMap(String str) =>
    List<CommentsOnPostsModel>.from(
        json.decode(str).map((x) => CommentsOnPostsModel.fromMap(x)));

String commentsOnPostsModelToMap(List<CommentsOnPostsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class CommentsOnPostsModel {
  CommentsOnPostsModel({
    this.postId,
    this.id,
    this.name,
    this.email,
    this.body,
  });

  int postId;
  int id;
  String name;
  String email;
  String body;

  factory CommentsOnPostsModel.fromMap(Map<String, dynamic> json) =>
      CommentsOnPostsModel(
        postId: json["postId"],
        id: json["id"],
        name: json["name"],
        email: json["email"],
        body: json["body"],
      );

  Map<String, dynamic> toMap() => {
        "postId": postId,
        "id": id,
        "name": name,
        "email": email,
        "body": body,
      };
}
