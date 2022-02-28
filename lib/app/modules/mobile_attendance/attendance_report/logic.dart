import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:mobile_attendance/app/data/api/api_service.dart';
import 'package:mobile_attendance/app/data/local/manager/db_manager.dart';
import 'package:mobile_attendance/app/model/request/get_attendance_report/get_attendance_report_body.dart';
import 'package:mobile_attendance/app/model/response/attendance_model/attendance_model.dart';
import 'package:mobile_attendance/app/model/response/result_attendance/result_attendance.dart';
import 'package:mobile_attendance/app/theme/app_colors.dart';
import 'package:mobile_attendance/app/utils/custom_bottom_sheet.dart';
import 'package:mobile_attendance/app/utils/key_words.dart';
import 'package:mobile_attendance/app/utils/service.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import 'state.dart';

class AttendanceReportLogic extends GetxController {
  final AttendanceReportState state = AttendanceReportState();

  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now();
  ResultAttendance? resultAttendance;
  User? resultUser;
  List<AttendanceModel> listAttendance = <AttendanceModel>[];

  @override
  void onInit() async {
    super.onInit();
    resultUser = await locator<AppDatabase>().getUser();
    update();
    await getReport();
  }

  openDatePicker({required bool isStartDate}) {
    customBottomSheet(
      child: SfDateRangePicker(
        monthViewSettings: DateRangePickerMonthViewSettings(
          weekNumberStyle: DateRangePickerWeekNumberStyle(
              textStyle: Theme.of(Get.context!).textTheme.headline6!),
          viewHeaderStyle: DateRangePickerViewHeaderStyle(
              textStyle: Theme.of(Get.context!).textTheme.headline6!),
        ),
        monthCellStyle: DateRangePickerMonthCellStyle(
          textStyle: Theme.of(Get.context!).textTheme.headline6!,
          blackoutDateTextStyle: Theme.of(Get.context!).textTheme.headline6!,
          todayTextStyle: Theme.of(Get.context!)
              .textTheme
              .headline6!
              .merge(TextStyle(color: mainColor)),
        ),
        yearCellStyle: DateRangePickerYearCellStyle(
            textStyle: Theme.of(Get.context!).textTheme.headline6!),
        headerStyle: DateRangePickerHeaderStyle(
            textStyle: Theme.of(Get.context!).textTheme.headline5!),
        onSelectionChanged: (dateRangePickerSelectionChangedArgs) {
          if (isStartDate) {
            startDate = dateRangePickerSelectionChangedArgs.value;
            update();
          } else {
            endDate = dateRangePickerSelectionChangedArgs.value;
            update();
          }
        },
      ),
    );
  }

  getReport() async {
    String code = "";

    if (resultUser!.code != cmi) {
      code = cmg;
    } else {
      code = resultUser!.code;
    }

    await ApiService().getAttendance(
        onSuccess: (data) {
          resultAttendance = data;
          update();
          removeNullData();
        },
        data: GetAttendanceReportBody(
            comCode: code,
            staffId: resultUser!.staffId,
            fromDate: startDate,
            toDate: endDate));
  }

  void removeNullData() {
    listAttendance.clear();
    for (var item in resultAttendance!.data) {
      if (item.status != null && item.firstTimeIN != null) {
        listAttendance.add(item);
        update();
      }
    }
    Logger().wtf(resultAttendance!.data.length);
    Logger().i(listAttendance.length);
  }
}
