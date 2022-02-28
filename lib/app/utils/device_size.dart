import 'dart:math';

import 'package:get/get.dart';

var deviceHeight = Get.height;
var deviceWidth = Get.width;
var deviceArea = Get.height * Get.width;
var deviceDiagonal = sqrt(pow(deviceHeight, 2) + pow(deviceWidth, 2));
