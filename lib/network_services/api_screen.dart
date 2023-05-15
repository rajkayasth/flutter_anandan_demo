import 'dart:convert';
import 'dart:io';

import 'package:anandan_demo_flutter/model/QuotesModel.dart';
import 'package:anandan_demo_flutter/model/UserImageModel.dart';
import 'package:anandan_demo_flutter/model/UserModel.dart';
import 'package:anandan_demo_flutter/model/UserPostResponse.dart';
import 'package:anandan_demo_flutter/model/post_model.dart';
import 'package:anandan_demo_flutter/model/UserLIstResponse.dart';
import 'package:anandan_demo_flutter/utils/constans.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

class ApiInterface {
  var client = http.Client();

  Dio? dio;

  ApiInterface() {
    if (dio == null) {
      BaseOptions options = BaseOptions(
          baseUrl: "https://jsonplaceholder.typicode.com/photos",
          receiveDataWhenStatusError: true,
          connectTimeout: const Duration(seconds: 60), // 60 seconds
          receiveTimeout: const Duration(seconds: 60) // 60 seconds
          );

      dio = Dio(options);
      dio?.interceptors.add(InterceptorsWrapper(
        onRequest: (options, handler) {
          debugPrint(options.path);
          return handler.next(options);
        },
        onResponse: (e, handler) {
          debugPrint("${e.statusCode}\n${e.requestOptions.queryParameters}");
          debugPrint(e.statusMessage.toString());
          debugPrint(e.data.toString());
          return handler.next(e);
        },
        onError: (e, handler) {
          debugPrint(e.stackTrace.toString());
          return handler.next(e);
        },
      ));
    }
  }

  Future<List<PostModel>?> getPosts() async {
    var uri = Uri.parse('https://jsonplaceholder.typicode.com/posts');

    try {
      var response = await client.get(uri);

      if (response.statusCode == 200) {
        var json = response.body;
        //debugPrint("API RESPONSE $json");
        return postModelFromJson(json);
      }
    } on SocketException catch (_) {
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
        var data1 = jsonDecode(response.body);
        /*  var userModel =  List<Map<String,dynamic>>.from(data1).forEach((element) {
         debugPrint(element['name']);
         UserModel(name: element['name'],id: element['id'],);
       });*/

        for (Map i in data) {
          userList.add(UserModel.fromJson(i));
        }
        return userList;
      } else {
        return userList;
      }
    } on SocketException catch (_) {
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
    } on SocketException catch (_) {
      print("Internet Connection not available");
    }
  }

  Future<List<UserImageModel>?> getUserImageData() async {
    try {
      var uri = Uri.parse('https://jsonplaceholder.typicode.com/photos');

      var response = await dio!.getUri(uri);
      List<UserImageModel> userImageList = [];
      if (response.statusCode == 200) {
        var json = response.data;
        //var data = jsonDecode(json);
        for (Map<String, dynamic> i in json) {
          // debugPrint(i['title']);
          userImageList.add(UserImageModel.fromJson(i));
        }
        return userImageList;
      } else {
        return userImageList;
      }
    } on DioError catch (e) {
      if (e.response != null) {
        debugPrint(e.message);
        debugPrint(e.response?.statusCode.toString());
        debugPrint(e.response?.requestOptions.toString());
      } else {
        debugPrint(e.message);
        debugPrint(e.requestOptions.toString());
      }
    }
  }

  ///Get Api call with Parameter
  Future<UserListResponse?> getUserListResponse() async {
    final queryParameters = {
      'page': 2,
    };
    try {
      var response = await dio?.get(Constant.baseUrl + Constant.users,
          queryParameters: queryParameters);

      if (response?.statusCode == 200) {
        var json = response?.data;
        //  debugPrint("USER_LIST_REPONSE $json");
        return UserListResponse.fromJson(json);
      }
    } on DioError catch (e) {
      if (e.response != null) {
        debugPrint(e.message);
        debugPrint(e.response?.statusCode.toString());
        debugPrint(e.response?.requestOptions.toString());
      } else {
        debugPrint(e.message);
        debugPrint(e.requestOptions.toString());
      }
    }
  }

  ///Post Api call with Parameter
  Future<UserPostResponse?> getUserPostResponse(String name, String job) async {
    final queryParameters = {"name": name, "job": job};
    try {
      var response = await dio?.post(Constant.baseUrl + Constant.users,
          data: queryParameters);

      if (response?.statusCode == 200 || response?.statusCode == 201) {
        var json = response?.data;
        debugPrint("USER_LIST_REPONSE $json");
        return UserPostResponse.fromJson(json);
      }
    } on DioError catch (e) {
      if (e.response != null) {
        debugPrint(e.message);
        debugPrint(e.response?.statusCode.toString());
        debugPrint(e.response?.requestOptions.toString());
      } else {
        debugPrint(e.message);
        debugPrint(e.requestOptions.toString());
      }
    }
  }
}
