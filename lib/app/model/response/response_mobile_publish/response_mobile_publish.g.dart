// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_mobile_publish.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseMobilePublish _$ResponseMobilePublishFromJson(
        Map<String, dynamic> json) =>
    ResponseMobilePublish(
      version: json['version'] as String?,
      build: json['build'] as int?,
      publishDate: json['publishDate'] == null
          ? null
          : DateTime.parse(json['publishDate'] as String),
      createdDate: json['createdDate'] == null
          ? null
          : DateTime.parse(json['createdDate'] as String),
      updatedDate: json['updatedDate'] == null
          ? null
          : DateTime.parse(json['updatedDate'] as String),
      createdBy: json['createdBy'] as String?,
      updatedBy: json['updatedBy'] as String?,
      isLatest: json['isLatest'] as bool?,
      isForce: json['isForce'] as bool?,
    );

Map<String, dynamic> _$ResponseMobilePublishToJson(
        ResponseMobilePublish instance) =>
    <String, dynamic>{
      'version': instance.version,
      'build': instance.build,
      'publishDate': instance.publishDate?.toIso8601String(),
      'createdDate': instance.createdDate?.toIso8601String(),
      'updatedDate': instance.updatedDate?.toIso8601String(),
      'createdBy': instance.createdBy,
      'updatedBy': instance.updatedBy,
      'isForce': instance.isForce,
      'isLatest': instance.isLatest,
    };
