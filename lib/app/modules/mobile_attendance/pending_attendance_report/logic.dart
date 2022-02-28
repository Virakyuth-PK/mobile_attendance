import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';
import 'package:logger/logger.dart';
import 'package:mobile_attendance/app/data/api/api_service.dart';
import 'package:mobile_attendance/app/data/local/converter/attendance_converter.dart';
import 'package:mobile_attendance/app/data/local/manager/db_manager.dart';
import 'package:mobile_attendance/app/model/request/check_attendance/check_attendance_body.dart';
import 'package:mobile_attendance/app/model/request/get_attendance_report/get_attendance_report_body.dart';
import 'package:mobile_attendance/app/modules/mobile_attendance/home/logic.dart';
import 'package:mobile_attendance/app/theme/app_colors.dart';
import 'package:mobile_attendance/app/theme/app_decoration.dart';
import 'package:mobile_attendance/app/translations/tr_key_word.dart';
import 'package:mobile_attendance/app/utils/custom_bottom_sheet.dart';
import 'package:mobile_attendance/app/utils/custom_button.dart';
import 'package:mobile_attendance/app/utils/device_size.dart';
import 'package:mobile_attendance/app/utils/service.dart';

import 'state.dart';

class PendingAttendanceReportLogic extends GetxController {
  final PendingAttendanceReportState state = PendingAttendanceReportState();
  final homeLogic = Get.find<HomeLogic>();
  List<bool> isChecked = <bool>[];
  List<Attendance> pendingAttendance = <Attendance>[];

  @override
  void onInit() {
    super.onInit();
    pendingAttendance = homeLogic.pendingAttendance;
    isChecked = List<bool>.filled(homeLogic.pendingAttendance.length, false);
    update();
  }

  checkBoxOnChange(bool value, int index) {
    isChecked[index] = value;
    update();
  }

  removePending() async {
    for (var i = 0; i < pendingAttendance.length; i++) {
      if (isChecked[i]) {
        await locator<AppDatabase>().deleteAttendance(pendingAttendance[i]);
      }
    }
    homeLogic.pendingAttendance = await locator<AppDatabase>().getAttendance();
    pendingAttendance = homeLogic.pendingAttendance;
    isChecked = List<bool>.filled(homeLogic.pendingAttendance.length, false);
    homeLogic.update();
  }

  reSend() async {
    var sendSuccess = 0;
    var sendFail = 0;
    for (var i = 0; i < pendingAttendance.length; i++) {
      if (isChecked[i]) {
        await EasyLoading.show(
            status: checkingYourLocation.tr,
            maskType: EasyLoadingMaskType.black);

        CheckAttendanceBody checkAttendanceBody =
            converterAttendanceMoor(pendingAttendance[i]);

        await ApiService().checkAttendance(
            onSuccess: (data) async {
              await ApiService().getAttendance(
                onSuccess: (data) {
                  sendSuccess++;
                  update();
                },
                onError: (error) {
                  sendFail++;
                  update();
                },
                data: GetAttendanceReportBody(
                  comCode: pendingAttendance[i].comCode,
                  staffId: pendingAttendance[i].staffId,
                  fromDate: DateTime.now(),
                  toDate: DateTime.now(),
                ),
              );
            },
            data: checkAttendanceBody);
      }
    }

    customBottomSheet(
      child: Container(
        padding: screenPaddingAll(),
        child: CustomButton(
          toolTip: "",
          onPress: () => null,
          child: Container(
            padding: EdgeInsets.symmetric(
                horizontal: deviceWidth * 0.04, vertical: deviceHeight * 0.035),
            decoration: containerDecoration(),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Total :: " + pendingAttendance.length.toString(),
                      style: Theme.of(Get.context!)
                          .textTheme
                          .headline5!
                          .merge(TextStyle(color: mainColor)),
                    ),
                    SizedBox(
                      height: deviceDiagonal * 0.01,
                    ),
                    Text(
                      "Send Success :: " + sendSuccess.toString(),
                      style: Theme.of(Get.context!)
                          .textTheme
                          .headline5!
                          .merge(TextStyle(color: mainColor)),
                    ),
                    SizedBox(
                      height: deviceDiagonal * 0.01,
                    ),
                    Text(
                      "Send Fail :: " + sendFail.toString(),
                      style: Theme.of(Get.context!)
                          .textTheme
                          .headline5!
                          .merge(TextStyle(color: mainColor)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );

    homeLogic.pendingAttendance = await locator<AppDatabase>().getAttendance();
    pendingAttendance = homeLogic.pendingAttendance;
    isChecked = List<bool>.filled(homeLogic.pendingAttendance.length, false);
    homeLogic.update();
  }

  Future<LocationData?> getLocation() async {
    Location location = Location();

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        Logger().e(_serviceEnabled);
        return null;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        Logger().e(_permissionGranted);
        return null;
      }
    }

    var locationData = await location.getLocation();

    return locationData;
  }
}
