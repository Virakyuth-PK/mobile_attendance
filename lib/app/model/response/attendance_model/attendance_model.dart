import 'package:json_annotation/json_annotation.dart';

part 'attendance_model.g.dart';

@JsonSerializable()
class AttendanceModel {
  String userId;
  DateTime? firstTimeIN;
  DateTime? lastTimeOUT;
  String? status;

  AttendanceModel(
      {required this.userId,
      this.firstTimeIN,
      this.lastTimeOUT,
      this.status});

  factory AttendanceModel.fromJson(Map<String, dynamic> json) =>
      _$AttendanceModelFromJson(json);

  Map<String, dynamic> toJson() => _$AttendanceModelToJson(this);
}
