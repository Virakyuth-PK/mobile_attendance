import 'package:json_annotation/json_annotation.dart';

part 'result_message.g.dart';

@JsonSerializable()
class ResultMessage  {
  bool result;
  String message;


  ResultMessage(this.result, this.message);

  factory ResultMessage.fromJson(Map<String, dynamic> json) =>
      _$ResultMessageFromJson(json);

  Map<String, dynamic> toJson() => _$ResultMessageToJson(this);
}