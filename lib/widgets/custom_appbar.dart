import 'package:anandan_demo_flutter/ui_helper/custom_colors.dart';
import 'package:flutter/material.dart';

AppBar CustomAppBar({required VoidCallback onTap,required String title,required VoidCallback leadingIconTap}) {
  return AppBar(
    title:  Text(
      title,
      style: const TextStyle(
          color: CustomColor.darkBlue,
          fontSize: 22,
          fontWeight: FontWeight.bold,
          fontFamily: "FontMainBold"),
    ),
    leading: InkWell(
      onTap: leadingIconTap,
      child: CircleAvatar(
        backgroundColor: Colors.white,
        child: Image.asset(
          "assets/images/man.png",
          height: 30,
          width: 30,
          fit: BoxFit.cover,
        ),
      ),
    ),
    backgroundColor: Colors.white,
    centerTitle: true,
    elevation: 1,
    actions: [
      IconButton(
          onPressed: onTap,
          icon: const Icon(
            Icons.notifications_active,
            color: CustomColor.darkBlue,
          ))
    ],
  );
}
