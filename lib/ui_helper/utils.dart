import 'package:anandan_demo_flutter/ui_helper/custom_colors.dart';
import 'package:flutter/material.dart';

TextStyle titleTextStyle11({
  Color textColor = Colors.black45,
  FontWeight fontWeight = FontWeight.normal
}) {
  return TextStyle(
    fontSize: 11,
    color: textColor,
    fontWeight: fontWeight,
  );
}

TextStyle titleTextStyle16({
  Color textColor = Colors.black45,
  FontWeight fontWeight = FontWeight.normal
}) {
  return TextStyle(
    fontSize: 16,
    color: textColor,
    fontWeight: fontWeight,
  );
}

TextStyle titleTextStyle31({
  Color textColor = Colors.black45,
  FontWeight fontWeight = FontWeight.normal
}) {
  return TextStyle(
    fontSize: 31,
    color: textColor,
    fontWeight: fontWeight,
  );
}


TextStyle titleTextStyle20({
  Color textColor = Colors.black45,
  FontWeight fontWeight = FontWeight.normal
}) {
  return TextStyle(
    fontSize: 20,
    color: textColor,
    fontWeight: fontWeight,
  );
}

InputDecoration textFieldBorder({
  Color borderColor = Colors.grey,
  Icon? suffixIcon
}) {
  return InputDecoration(
    suffixIcon: suffixIcon,
    hintText: "Enter your password",
    labelText: "Password",
    hintStyle: const TextStyle(color: CustomColor.lightGray55),
    labelStyle: TextStyle(color: borderColor),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: const BorderSide(color: CustomColor.darkBlue),
    ),
    enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: const BorderSide(color: CustomColor.lightGray)),
  );
}