import 'dart:convert';
import 'dart:io';

import 'package:anandan_demo_flutter/model/QuotesModel.dart';
import 'package:anandan_demo_flutter/model/UserModel.dart';
import 'package:anandan_demo_flutter/model/post_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class ApiInterface {
  var client = http.Client();

  Future<List<PostModel>?> getPosts() async {
    var uri = Uri.parse('https://jsonplaceholder.typicode.com/posts');

    try {
      var response = await client.get(uri);

      if (response.statusCode == 200) {
        var json = response.body;
        //debugPrint("API RESPONSE $json");
        return postModelFromJson(json);
      }
    } on SocketException catch(_){
      print("Internet Connection not available");
    }
  }

  Future<List<UserModel>?> getUserData() async {
    var uri = Uri.parse('https://jsonplaceholder.typicode.com/users');

    List<UserModel> userList = [];

    try {
      var response = await client.get(uri);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        for (Map i in data) {
          debugPrint(i['name']);
          userList.add(UserModel.fromJson(i));
        }
        return userList;
      } else {
        return userList;
      }
    } on SocketException catch(_){
      print("Internet Connection not available");
    }
  }

  Future<QuotesModel?>? getQuotes() async {
    var uri = Uri.parse('https://quotable.io/quotes');

    try {
      var response = await client.get(uri);
      if (response.statusCode == 200) {
        var json = response.body;
        var data = jsonDecode(json);
        return QuotesModel.fromJson(data);
      }
    } on SocketException catch(_){
      print("Internet Connection not available");
    }
  }
}
