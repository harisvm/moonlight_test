import 'dart:convert';

///todolist for each users are received in this model
List<TodosByUserModel> todosByUserModelFromMap(String str) => List<TodosByUserModel>.from(json.decode(str).map((x) => TodosByUserModel.fromMap(x)));

String todosByUserModelToMap(List<TodosByUserModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class TodosByUserModel {
  TodosByUserModel({
    this.userId,
    this.id,
    this.title,
    this.completed,
  });

  int userId;
  int id;
  String title;
  bool completed;

  factory TodosByUserModel.fromMap(Map<String, dynamic> json) => TodosByUserModel(
    userId: json["userId"],
    id: json["id"],
    title: json["title"],
    completed: json["completed"],
  );

  Map<String, dynamic> toMap() => {
    "userId": userId,
    "id": id,
    "title": title,
    "completed": completed,
  };
}