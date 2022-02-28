import 'package:get/get.dart';
import 'package:mobile_attendance/app/modules/global_modules/authorized_check/binding.dart';
import 'package:mobile_attendance/app/modules/global_modules/authorized_check/view.dart';
import 'package:mobile_attendance/app/modules/global_modules/language/binding.dart';
import 'package:mobile_attendance/app/modules/global_modules/language/view.dart';
import 'package:mobile_attendance/app/modules/global_modules/login/binding.dart';
import 'package:mobile_attendance/app/modules/global_modules/login/view.dart';
import 'package:mobile_attendance/app/modules/mobile_attendance/attendance_report/binding.dart';
import 'package:mobile_attendance/app/modules/mobile_attendance/attendance_report/view.dart';
import 'package:mobile_attendance/app/modules/mobile_attendance/home/binding.dart';
import 'package:mobile_attendance/app/modules/mobile_attendance/home/view.dart';
import 'package:mobile_attendance/app/modules/mobile_attendance/pending_attendance_report/binding.dart';
import 'package:mobile_attendance/app/modules/mobile_attendance/pending_attendance_report/view.dart';

part './app_routes.dart';
/**
 * GetX Generator - fb.com/htngu.99
 * */

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.AUTHORIZED_CHECK,
      page: () => AuthorizedCheckPage(),
      binding: AuthorizedCheckBinding(),
    ),
    GetPage(
      name: Routes.HOME,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.LANGUAGE,
      page: () => LanguagePage(),
      binding: LanguageBinding(),
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.ATTENDANCE_REPORT,
      page: () => AttendanceReportPage(),
      binding: AttendanceReportBinding(),
    ),
    GetPage(
      name: Routes.PENDING_ATTENDANCE_REPORT,
      page: () => PendingAttendanceReportPage(),
      binding: PendingAttendanceReportBinding(),
    ),
  ];
}
