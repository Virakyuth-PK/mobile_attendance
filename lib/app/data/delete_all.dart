import 'package:get_storage/get_storage.dart';

import '../utils/service.dart';
import 'local/manager/db_manager.dart';
import 'local/storage/token.dart';
import 'local/storage/user_id.dart';

deleteAllData() async {
  // delete Get Storage
  var box = GetStorage();
  await box.erase();

  // delete Moor DB
  await locator<AppDatabase>().deleteTableUser();
}

deleteAllDB() async {
  // delete Get Storage
  await removeUserId();
  await removeToken();

  // delete Moor DB
  await locator<AppDatabase>().deleteTableUser();
}
