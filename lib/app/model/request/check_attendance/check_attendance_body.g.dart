// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'check_attendance_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CheckAttendanceBody _$CheckAttendanceBodyFromJson(Map<String, dynamic> json) =>
    CheckAttendanceBody(
      staffId: json['staffId'] as String,
      dateTime: DateTime.parse(json['dateTime'] as String),
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      address: json['address'] as String,
      imei: json['imei'] as String,
      eventID: json['eventID'] as String,
      comCode: json['comCode'] as String,
      imagePath: json['imagePath'] as String?,
    );

Map<String, dynamic> _$CheckAttendanceBodyToJson(
        CheckAttendanceBody instance) =>
    <String, dynamic>{
      'staffId': instance.staffId,
      'dateTime': instance.dateTime.toIso8601String(),
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'address': instance.address,
      'imei': instance.imei,
      'eventID': instance.eventID,
      'imagePath': instance.imagePath,
      'comCode': instance.comCode,
    };
