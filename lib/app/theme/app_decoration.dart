import 'package:flutter/material.dart';

import '../utils/device_size.dart';
import 'app_colors.dart';

screenPaddingHorizontal() {
  return EdgeInsets.symmetric(
    horizontal: deviceDiagonal * 0.025,
  );
}

screenPaddingAll() {
  return EdgeInsets.symmetric(
      horizontal: deviceDiagonal * 0.025, vertical: deviceDiagonal * 0.025);
}

cardPaddingAll() {
  return EdgeInsets.symmetric(
      horizontal: deviceDiagonal * 0.015, vertical: deviceDiagonal * 0.015);
}

containerDecoration({fillColor, shadow, borderRadius}) {
  return BoxDecoration(
    color: fillColor ?? whiteColor,
    boxShadow: [
      BoxShadow(
          color: shadow ?? Colors.transparent,
          spreadRadius: 1,
          blurRadius: 5,
          offset: const Offset(0, 3))
    ],
    borderRadius: borderRadius ?? BorderRadius.circular(10.0),
  );
}
