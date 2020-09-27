

import 'dart:convert';

List<PhotosByAlbumModel> photosByAlbumModelFromMap(String str) => List<PhotosByAlbumModel>.from(json.decode(str).map((x) => PhotosByAlbumModel.fromMap(x)));

String photosByAlbumModelToMap(List<PhotosByAlbumModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class PhotosByAlbumModel {
  PhotosByAlbumModel({
    this.albumId,
    this.id,
    this.title,
    this.url,
    this.thumbnailUrl,
  });

  int albumId;
  int id;
  String title;
  String url;
  String thumbnailUrl;

  factory PhotosByAlbumModel.fromMap(Map<String, dynamic> json) => PhotosByAlbumModel(
    albumId: json["albumId"],
    id: json["id"],
    title: json["title"],
    url: json["url"],
    thumbnailUrl: json["thumbnailUrl"],
  );

  Map<String, dynamic> toMap() => {
    "albumId": albumId,
    "id": id,
    "title": title,
    "url": url,
    "thumbnailUrl": thumbnailUrl,
  };
}
