import 'package:logger/logger.dart';

import '../../model/request/check_attendance/check_attendance_body.dart';
import '../../model/request/get_attendance_report/get_attendance_report_body.dart';
import '../../model/request/login/login_body.dart';
import '../../model/response/response_mobile_publish/response_mobile_publish.dart';
import '../../model/response/result_attendance/result_attendance.dart';
import '../../model/response/result_message/result_message.dart';
import '../../model/response/result_user/result_user.dart';
import '../../utils/service.dart';
import '../local/converter/user_converter.dart';
import '../local/manager/db_manager.dart';
import '../local/storage/token.dart';
import '../local/storage/user_id.dart';
import 'api_url.dart';
import 'app_dio.dart';

class ApiService {
  var apiBaseUrl = productionBaseUrl;

  Future<void> login(
      {required Function(ResultUser data) onSuccess,
      required LoginBody data,
      Function(dynamic error)? onError}) async {
    try {
      Logger().d(data.toJson());
      await AppDio.dio()
          .post(apiBaseUrl + loginPath, data: data)
          .then((res) async {
        //write data
        var resultUser = ResultUser.fromJson(res.data);
        await locator<AppDatabase>().insertUser(convertUserJson(resultUser));
        writeUserId(resultUser.staffId);
        writeToken("Bearer " + resultUser.token.toString());
        return await onSuccess(resultUser);
      }).catchError((error) => onError!(error));
    } catch (error, stacktrace) {
      Logger().e("Exception occurred: $error stackTrace: $stacktrace");
    }
  }

  Future<void> checkAttendance(
      {required Function(ResultMessage data) onSuccess,
      required CheckAttendanceBody data,
      Function(dynamic error)? onError}) async {
    try {
      await AppDio.dioToken(getToken())
          .post(apiBaseUrl + checkAttendancePath, data: data)
          .then((res) async {
        //write data
        var data = ResultMessage.fromJson(res.data);
        return await onSuccess(data);
      }).catchError((error) => onError!(error));
    } catch (error, stacktrace) {
      Logger().e("Exception occurred: $error stackTrace: $stacktrace");
    }
  }

  Future<void> getAttendance(
      {required Function(ResultAttendance data) onSuccess,
      Function(dynamic error)? onError,
      required GetAttendanceReportBody data}) async {
    try {
      Logger().d(data.toJson());
      await AppDio.dioToken(getToken())
          .post(apiBaseUrl + getAttendancePath, data: data)
          .then((res) async {
        //write data
        var data = ResultAttendance.fromJson(res.data);
        return await onSuccess(data);
      }).catchError((error) => onError!(error));
    } catch (error, stacktrace) {
      Logger().e("Exception occurred: $error stackTrace: $stacktrace");
    }
  }

  Future<void> mobilePublishCheckUpdate(
      {required Function(ResponseMobilePublish data) onSuccess}) async {
    try {
      await AppDio.dioToken(getToken()).get(apiBaseUrl + checkUpdatePath).then(
          (res) async =>
              await onSuccess(ResponseMobilePublish.fromJson(res.data)));
    } catch (error, stacktrace) {
      // customSnackBar(message: error.toString(), colorText: whiteColor);
      Logger().e("Exception occurred: $error stackTrace: $stacktrace");
    }
  }
}
