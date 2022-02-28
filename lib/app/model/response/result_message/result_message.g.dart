// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResultMessage _$ResultMessageFromJson(Map<String, dynamic> json) =>
    ResultMessage(
      json['result'] as bool,
      json['message'] as String,
    );

Map<String, dynamic> _$ResultMessageToJson(ResultMessage instance) =>
    <String, dynamic>{
      'result': instance.result,
      'message': instance.message,
    };
