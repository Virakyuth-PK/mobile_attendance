import 'package:mobile_attendance/app/model/response/result_user/result_user.dart';

import '../manager/db_manager.dart';

convertUserJson(ResultUser data) {
  return User(
      staffId: data.staffId,
      role: data.role,
      result: data.result,
      department: data.department,
      code: data.code,
      message: data.message,
      token: data.token,
      name: data.name);
}