// To parse this JSON data, do
//
//     final userImageModel = userImageModelFromJson(jsonString);

import 'dart:convert';

List<UserImageModel> userImageModelFromJson(String str) => List<UserImageModel>.from(json.decode(str).map((x) => UserImageModel.fromJson(x)));

String userImageModelToJson(List<UserImageModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserImageModel {
  int? albumId;
  int? id;
  String? title;
  String? url;
  String? thumbnailUrl;

  UserImageModel({
    this.albumId,
    this.id,
    this.title,
    this.url,
    this.thumbnailUrl,
  });

  factory UserImageModel.fromJson(Map<String, dynamic> json) => UserImageModel(
    albumId: json["albumId"],
    id: json["id"],
    title: json["title"],
    url: json["url"],
    thumbnailUrl: json["thumbnailUrl"],
  );

  Map<String, dynamic> toJson() => {
    "albumId": albumId,
    "id": id,
    "title": title,
    "url": url,
    "thumbnailUrl": thumbnailUrl,
  };
}
