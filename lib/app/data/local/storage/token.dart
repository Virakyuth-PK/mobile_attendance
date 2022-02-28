import 'package:get_storage/get_storage.dart';

import '../../../utils/key_words.dart';

getToken() {
  var box = GetStorage();
  return box.read(userToken);
}

writeToken(var data) async {
  var box = GetStorage();
  await box.write(userToken, data);
}

removeToken() async {
  var box = GetStorage();
  await box.remove(userToken);
}
