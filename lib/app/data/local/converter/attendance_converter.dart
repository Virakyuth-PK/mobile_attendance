import 'package:logger/logger.dart';
import 'package:mobile_attendance/app/data/local/manager/db_manager.dart';
import 'package:mobile_attendance/app/model/request/check_attendance/check_attendance_body.dart';

converterAttendanceMoor(Attendance attendance) {
  return CheckAttendanceBody(
      staffId: attendance.staffId,
      dateTime: attendance.dateTimeAttendance,
      latitude: attendance.latitude,
      longitude: attendance.longitude,
      address: attendance.address,
      imei: attendance.imei,
      eventID: attendance.eventID,
      comCode: attendance.comCode);
}

converterAttendanceJson(CheckAttendanceBody checkAttendanceBody,
    {required reason}) {

  var data = Attendance(
      staffId: checkAttendanceBody.staffId,
      dateTimeAttendance: checkAttendanceBody.dateTime,
      latitude: checkAttendanceBody.latitude,
      longitude: checkAttendanceBody.longitude,
      address: checkAttendanceBody.address,
      imei: checkAttendanceBody.imei,
      eventID: checkAttendanceBody.eventID,
      imagePath: checkAttendanceBody.imagePath ?? "",
      comCode: checkAttendanceBody.comCode,
      reason: reason);

  Logger().e(data.toJson());

  return Attendance(
      staffId: checkAttendanceBody.staffId,
      dateTimeAttendance: checkAttendanceBody.dateTime,
      latitude: checkAttendanceBody.latitude,
      longitude: checkAttendanceBody.longitude,
      address: checkAttendanceBody.address,
      imei: checkAttendanceBody.imei,
      eventID: checkAttendanceBody.eventID,
      imagePath: checkAttendanceBody.imagePath ?? "",
      comCode: checkAttendanceBody.comCode,
      reason: reason);
}
