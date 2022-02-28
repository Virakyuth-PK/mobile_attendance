// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResultUser _$ResultUserFromJson(Map<String, dynamic> json) => ResultUser(
      result: json['result'] as bool,
      token: json['token'] as String,
      message: json['message'] as String,
      code: json['code'] as String,
      staffId: json['staffId'] as String,
      name: json['name'] as String,
      role: json['role'] as String,
      department: json['department'] as String,
    );

Map<String, dynamic> _$ResultUserToJson(ResultUser instance) =>
    <String, dynamic>{
      'result': instance.result,
      'token': instance.token,
      'message': instance.message,
      'code': instance.code,
      'staffId': instance.staffId,
      'name': instance.name,
      'role': instance.role,
      'department': instance.department,
    };
