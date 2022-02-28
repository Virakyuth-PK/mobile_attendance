// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_attendance_report_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAttendanceReportBody _$GetAttendanceReportBodyFromJson(
        Map<String, dynamic> json) =>
    GetAttendanceReportBody(
      staffId: json['staffId'] as String,
      fromDate: DateTime.parse(json['fromDate'] as String),
      toDate: DateTime.parse(json['toDate'] as String),
      comCode: json['comCode'] as String,
    );

Map<String, dynamic> _$GetAttendanceReportBodyToJson(
        GetAttendanceReportBody instance) =>
    <String, dynamic>{
      'staffId': instance.staffId,
      'fromDate': instance.fromDate.toIso8601String(),
      'toDate': instance.toDate.toIso8601String(),
      'comCode': instance.comCode,
    };
