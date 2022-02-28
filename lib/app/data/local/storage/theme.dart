import 'package:get_storage/get_storage.dart';

import '../../../utils/key_words.dart';

getTheme() {
  var box = GetStorage();
  return box.read(userTheme);
}

writeTheme(var data) async {
  var box = GetStorage();
  await box.write(userTheme, data);
}

removeTheme() async {
  var box = GetStorage();
  await box.remove(userTheme);
}
