import 'package:get/get.dart';

import '../../../data/local/manager/db_manager.dart';
import '../../../data/local/storage/language.dart';
import '../../../utils/service.dart';
import '../../mobile_attendance/home/binding.dart';
import '../../mobile_attendance/home/view.dart';
import '../language/binding.dart';
import '../language/view.dart';
import '../login/binding.dart';
import '../login/view.dart';
import 'state.dart';

class AuthorizedCheckLogic extends GetxController {
  final AuthorizedCheckState state = AuthorizedCheckState();

  @override
  Future<void> onInit() async {
    super.onInit();
    await checkAuthorized();
  }

  Future<void> checkAuthorized() async {
    var resultUser = await locator<AppDatabase>().getUser();
    var resultLanguage = getLanguage();

    if (resultLanguage == null || resultLanguage == "") {
      Get.offAll(() => LanguagePage(), binding: LanguageBinding());
    } else {
      if (resultUser == null) {
        Get.offAll(() => LoginPage(), binding: LoginBinding());
      } else {
        Get.offAll(() => HomePage(), binding: HomeBinding());
      }
    }
  }
}
