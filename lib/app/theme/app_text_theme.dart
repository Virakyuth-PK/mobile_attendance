import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../gen/fonts.gen.dart';
import '../utils/key_words.dart';

appTextTheme() {
  return TextTheme(
    caption: TextStyle(
      fontFamily: Get.locale == null ||
              Get.locale == Locale(englishCode) ||
              Get.deviceLocale == const Locale("en_US")
          ? FontFamily.montserrat
          : FontFamily.nokora,
    ),
    button: TextStyle(
      fontFamily: Get.locale == null ||
              Get.locale == Locale(englishCode) ||
              Get.deviceLocale == const Locale("en_US")
          ? FontFamily.montserrat
          : FontFamily.nokora,
    ),
    headline1: TextStyle(
      fontFamily: Get.locale == null ||
              Get.locale == Locale(englishCode) ||
              Get.deviceLocale == const Locale("en_US")
          ? FontFamily.montserrat
          : FontFamily.nokora,
    ),
    bodyText1: TextStyle(
      fontFamily: Get.locale == null ||
              Get.locale == Locale(englishCode) ||
              Get.deviceLocale == const Locale("en_US")
          ? FontFamily.montserrat
          : FontFamily.nokora,
    ),
    bodyText2: TextStyle(
      fontFamily: Get.locale == null ||
              Get.locale == Locale(englishCode) ||
              Get.deviceLocale == const Locale("en_US")
          ? FontFamily.montserrat
          : FontFamily.nokora,
    ),
    headline2: TextStyle(
      fontFamily: Get.locale == null ||
              Get.locale == Locale(englishCode) ||
              Get.deviceLocale == const Locale("en_US")
          ? FontFamily.montserrat
          : FontFamily.nokora,
    ),
    headline3: TextStyle(
      fontFamily: Get.locale == null ||
              Get.locale == Locale(englishCode) ||
              Get.deviceLocale == const Locale("en_US")
          ? FontFamily.montserrat
          : FontFamily.nokora,
      fontSize: 40.0
    ),
    headline4: TextStyle(
      fontFamily: Get.locale == null ||
              Get.locale == Locale(englishCode) ||
              Get.deviceLocale == const Locale("en_US")
          ? FontFamily.montserrat
          : FontFamily.nokora,
    ),
    headline5: TextStyle(
      fontFamily: Get.locale == null ||
              Get.locale == Locale(englishCode) ||
              Get.deviceLocale == const Locale("en_US")
          ? FontFamily.montserrat
          : FontFamily.nokora,
        fontSize: Platform.isAndroid ? 30.0 : 25.0
    ),
    headline6: TextStyle(
      fontFamily: Get.locale == null ||
              Get.locale == Locale(englishCode) ||
              Get.deviceLocale == const Locale("en_US")
          ? FontFamily.montserrat
          : FontFamily.nokora,
      fontSize: Platform.isAndroid ? 20.0 : 15.0
    ),
    overline: TextStyle(
      fontFamily: Get.locale == null ||
              Get.locale == Locale(englishCode) ||
              Get.deviceLocale == const Locale("en_US")
          ? FontFamily.montserrat
          : FontFamily.nokora,
    ),
    subtitle1: TextStyle(
      fontFamily: Get.locale == null ||
              Get.locale == Locale(englishCode) ||
              Get.deviceLocale == const Locale("en_US")
          ? FontFamily.montserrat
          : FontFamily.nokora,
    ),
    subtitle2: TextStyle(
      fontFamily: Get.locale == null ||
              Get.locale == Locale(englishCode) ||
              Get.deviceLocale == const Locale("en_US")
          ? FontFamily.montserrat
          : FontFamily.nokora,
    ),
  );
}
