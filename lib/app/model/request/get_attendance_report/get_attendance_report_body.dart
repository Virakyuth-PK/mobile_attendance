import 'package:json_annotation/json_annotation.dart';

part 'get_attendance_report_body.g.dart';

@JsonSerializable()
class GetAttendanceReportBody {
  final String staffId;
  final DateTime fromDate;
  final DateTime toDate;
  final String comCode;

  GetAttendanceReportBody(
      {required this.staffId,
      required this.fromDate,
      required this.toDate,
      required this.comCode});

  factory GetAttendanceReportBody.fromJson(Map<String, dynamic> json) =>
      _$GetAttendanceReportBodyFromJson(json);

  Map<String, dynamic> toJson() => _$GetAttendanceReportBodyToJson(this);
}
