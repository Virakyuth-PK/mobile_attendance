import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../data/local/manager/db_manager.dart';
import '../../../data/local/storage/language.dart';
import '../../../utils/key_words.dart';
import '../../../utils/service.dart';
import '../../mobile_attendance/home/binding.dart';
import '../../mobile_attendance/home/view.dart';
import '../login/binding.dart';
import '../login/view.dart';
import 'state.dart';

class LanguageLogic extends GetxController {
  final LanguageState state = LanguageState();

  selectLocale(code) async {
    if (code == khmerCode) {
      await writeLanguage(khmerCode);
      Get.updateLocale(Locale(khmerCode));
    } else {
      await writeLanguage(englishCode);
      Get.updateLocale(Locale(englishCode));
    }
    var resultUser = await locator<AppDatabase>().getUser();
    if (resultUser == null || resultUser == "") {
      Get.offAll(() => LoginPage(), binding: LoginBinding());
    } else {
      Get.offAll(() => HomePage(), binding: HomeBinding());
    }
  }
}
