import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

import 'app/data/local/storage/language.dart';
import 'app/routes/app_pages.dart';
import 'app/theme/app_colors.dart';
import 'app/theme/app_text_theme.dart';
import 'app/translations/app_translations.dart';
import 'app/utils/key_words.dart';
import 'app/utils/service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  await GetStorage.init();
  await setupLocator();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Color(0xffA2C8B5),
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarColor: Color(0xffA2C8B5),
      systemNavigationBarDividerColor: Color(0xffA2C8B5),
      systemNavigationBarIconBrightness: Brightness.light,
      systemNavigationBarContrastEnforced: true));
  runApp(
    KeyboardDismisser(
      gestures: const [GestureType.onTap, GestureType.onPanUpdateDownDirection],
      child: GetMaterialApp(
        enableLog: true,
        defaultTransition: Transition.cupertino,
        popGesture: Get.isPopGestureEnable,
        theme: ThemeData(
          scaffoldBackgroundColor: shadowPrimaryColor,
          primarySwatch: mainColor,
          textTheme: appTextTheme(),
        ),
        translations: AppTranslation(),
        fallbackLocale: Locale(englishCode),
        locale:
            getLanguage() != null ? Locale(getLanguage()) : Locale(englishCode),
        initialRoute: Routes.AUTHORIZED_CHECK,
        getPages: AppPages.pages,
        debugShowCheckedModeBanner: false,
        builder: EasyLoading.init(),
      ),
    ),
  );
}
