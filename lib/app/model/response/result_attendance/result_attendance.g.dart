// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result_attendance.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResultAttendance _$ResultAttendanceFromJson(Map<String, dynamic> json) =>
    ResultAttendance(
      json['result'] as bool,
      (json['data'] as List<dynamic>)
          .map((e) => AttendanceModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['message'] as String,
    );

Map<String, dynamic> _$ResultAttendanceToJson(ResultAttendance instance) =>
    <String, dynamic>{
      'result': instance.result,
      'data': instance.data,
      'message': instance.message,
    };
