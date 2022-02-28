
import 'package:json_annotation/json_annotation.dart';

part 'login_body.g.dart';

@JsonSerializable()
class LoginBody {
  final String userId;
  final String pwd;

  LoginBody(this.userId, this.pwd);

  factory LoginBody.fromJson(Map<String, dynamic> json) =>
      _$LoginBodyFromJson(json);

  Map<String, dynamic> toJson() => _$LoginBodyToJson(this);
}