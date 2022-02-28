import 'package:get_storage/get_storage.dart';

import '../../../utils/key_words.dart';

getUserId() {
  var box = GetStorage();
  return box.read(userId);
}

writeUserId(var data) {
  var box = GetStorage();
  box.write(userId, data);
}

removeUserId() async {
  var box = GetStorage();
  await box.remove(userId);
}
