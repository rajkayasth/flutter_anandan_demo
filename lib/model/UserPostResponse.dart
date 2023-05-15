import 'dart:convert';
/// name : "morpheus"
/// job : "leader"
/// id : "230"
/// createdAt : "2023-05-15T08:35:37.480Z"

UserPostResponse userPostResponseFromJson(String str) => UserPostResponse.fromJson(json.decode(str));
String userPostResponseToJson(UserPostResponse data) => json.encode(data.toJson());
class UserPostResponse {
  UserPostResponse({
      this.name, 
      this.job, 
      this.id, 
      this.createdAt,});

  UserPostResponse.fromJson(dynamic json) {
    name = json['name'];
    job = json['job'];
    id = json['id'];
    createdAt = json['createdAt'];
  }
  String? name;
  String? job;
  String? id;
  String? createdAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['job'] = job;
    map['id'] = id;
    map['createdAt'] = createdAt;
    return map;
  }

}