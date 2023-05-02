

import 'package:flutter/material.dart';

class LearnerModel {
  String name = "";
  String gender = "";
  String age = "";
  String DOB = "";
  String subscriptionTime = "";
  String date = "";
  String expireText = "";
  Color expireColor = Colors.green;
  String imagePath = "";

  LearnerModel({
    required this.name,
    required this.gender,
    required this.age,
    required this.date,
    required this.DOB,
    required this.subscriptionTime,
    required this.expireText,
    required this.expireColor,
    required this.imagePath
      });
}


class DiagonsisModel {
  String name = "";


  DiagonsisModel({
    required this.name,
  });
}