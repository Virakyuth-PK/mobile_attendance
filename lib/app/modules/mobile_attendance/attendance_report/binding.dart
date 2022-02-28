import 'package:get/get.dart';

import 'logic.dart';

class AttendanceReportBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AttendanceReportLogic());
  }
}
