import 'package:json_annotation/json_annotation.dart';

import '../attendance_model/attendance_model.dart';

part 'result_attendance.g.dart';

@JsonSerializable()
class ResultAttendance {
  bool result;
  List<AttendanceModel> data;
  String message;

  ResultAttendance(this.result, this.data, this.message);

  factory ResultAttendance.fromJson(Map<String, dynamic> json) =>
      _$ResultAttendanceFromJson(json);

  Map<String, dynamic> toJson() => _$ResultAttendanceToJson(this);
}
