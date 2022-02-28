import 'package:get_storage/get_storage.dart';

import '../../../utils/key_words.dart';

getLanguage() {
  var box = GetStorage();
  return box.read(userLanguage);
}

writeLanguage(var data) async {
  var box = GetStorage();
  await box.write(userLanguage, data);
}

removeLanguage() async {
  var box = GetStorage();
  await box.remove(userLanguage);
}
