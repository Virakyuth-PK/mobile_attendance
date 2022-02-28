// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attendance_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AttendanceModel _$AttendanceModelFromJson(Map<String, dynamic> json) =>
    AttendanceModel(
      userId: json['userId'] as String,
      firstTimeIN: json['firstTimeIN'] == null
          ? null
          : DateTime.parse(json['firstTimeIN'] as String),
      lastTimeOUT: json['lastTimeOUT'] == null
          ? null
          : DateTime.parse(json['lastTimeOUT'] as String),
      status: json['status'] as String?,
    );

Map<String, dynamic> _$AttendanceModelToJson(AttendanceModel instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'firstTimeIN': instance.firstTimeIN?.toIso8601String(),
      'lastTimeOUT': instance.lastTimeOUT?.toIso8601String(),
      'status': instance.status,
    };
