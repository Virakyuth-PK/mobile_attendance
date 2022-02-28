import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_attendance/app/theme/app_colors.dart';
import 'package:mobile_attendance/app/utils/pop_over.dart';

customBottomSheet({required child}) {
  showModalBottomSheet<int>(
    backgroundColor: Colors.transparent,
    barrierColor: shadowGreyColor.withOpacity(0.75),
    context: Get.context!,
    builder: (context) {
      return Popover(
        child: child,
      );
    },
  );
}