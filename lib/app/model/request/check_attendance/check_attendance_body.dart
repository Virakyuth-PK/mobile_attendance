import 'package:json_annotation/json_annotation.dart';

part 'check_attendance_body.g.dart';

@JsonSerializable()
class CheckAttendanceBody {
  final String staffId;
  final DateTime dateTime;
  final double latitude;
  final double longitude;
  final String address;
  final String imei;
  final String eventID;
  String? imagePath;
  String comCode;

  CheckAttendanceBody(
      {required this.staffId,
      required this.dateTime,
      required this.latitude,
      required this.longitude,
      required this.address,
      required this.imei,
      required this.eventID,
      required this.comCode,
      this.imagePath});

  factory CheckAttendanceBody.fromJson(Map<String, dynamic> json) =>
      _$CheckAttendanceBodyFromJson(json);

  Map<String, dynamic> toJson() => _$CheckAttendanceBodyToJson(this);
}
