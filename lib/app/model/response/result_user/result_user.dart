import 'package:json_annotation/json_annotation.dart';

part 'result_user.g.dart';

@JsonSerializable()
class ResultUser {
  bool result;
  String token;
  String message;
  String code;
  String staffId;
  String name;
  String role;
  String department;

  ResultUser(
      {required this.result,
      required this.token,
      required this.message,
      required this.code,
      required this.staffId,
      required this.name,
      required this.role,
      required this.department});

  factory ResultUser.fromJson(Map<String, dynamic> json) =>
      _$ResultUserFromJson(json);

  Map<String, dynamic> toJson() => _$ResultUserToJson(this);
}
