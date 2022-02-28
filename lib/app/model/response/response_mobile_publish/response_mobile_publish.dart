import 'package:json_annotation/json_annotation.dart';

part 'response_mobile_publish.g.dart';

@JsonSerializable()
class ResponseMobilePublish {
  String? version;
  int? build;
  DateTime? publishDate;
  DateTime? createdDate;
  DateTime? updatedDate;
  String? createdBy;
  String? updatedBy;
  bool? isForce;
  bool? isLatest;

  ResponseMobilePublish(
      {this.version,
      this.build,
      this.publishDate,
      this.createdDate,
      this.updatedDate,
      this.createdBy,
      this.updatedBy,
       this.isLatest,
       this.isForce});

  factory ResponseMobilePublish.fromJson(Map<String, dynamic> json) =>
      _$ResponseMobilePublishFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseMobilePublishToJson(this);
}
