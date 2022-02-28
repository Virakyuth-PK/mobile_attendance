import 'package:get/get.dart';

import 'logic.dart';

class PendingAttendanceReportBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PendingAttendanceReportLogic());
  }
}
