import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app_colors.dart';

getTextFieldStyle({required hintText, fillColor, counterColor, suffixIcon}) {
  return InputDecoration(
    filled: true,
    fillColor: fillColor ?? whiteColor,
    contentPadding: EdgeInsets.only(left: Get.width * 0.05),
    enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: mainColor),
        borderRadius: BorderRadius.circular(10.0)),
    focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: mainColor),
        borderRadius: BorderRadius.circular(10.0)),
    focusColor: mainColor,
    icon: const Icon(Icons.account_circle_rounded),
    labelText: hintText,
    hintText: hintText,
    suffixIcon: suffixIcon,
  );
}

getPasswordTextFieldStyle({required hintText, required suffixIcon}) {
  return InputDecoration(
    filled: true,
    fillColor: whiteColor,
    contentPadding: EdgeInsets.only(left: Get.width * 0.05),
    enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: mainColor),
        borderRadius: BorderRadius.circular(8.0)),
    focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: mainColor),
        borderRadius: BorderRadius.circular(8.0)),
    icon: const Icon(Icons.password_rounded),
    counterStyle: Theme.of(Get.context!).textTheme.headline6,
    labelText: hintText,
    hintText: hintText,
    suffixIcon: suffixIcon,
  );
}
