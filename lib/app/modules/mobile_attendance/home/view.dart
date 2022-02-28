import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:mobile_attendance/app/modules/mobile_attendance/home_page/cmg_khb/view.dart';
import 'package:mobile_attendance/app/modules/mobile_attendance/home_page/cmi/view.dart';
import 'package:mobile_attendance/app/modules/mobile_attendance/more/view.dart';
import 'package:mobile_attendance/app/theme/app_colors.dart';
import 'package:mobile_attendance/app/translations/tr_key_word.dart';
import 'package:mobile_attendance/app/utils/custom_nav_bar.dart';
import 'package:mobile_attendance/app/utils/device_size.dart';
import 'package:mobile_attendance/app/utils/key_words.dart';
import 'package:mobile_attendance/gen/assets.gen.dart';

import 'logic.dart';

class HomePage extends StatelessWidget {
  final logic = Get.find<HomeLogic>();
  final state = Get.find<HomeLogic>().state;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarColor: Color(0xffA2C8B5),
        systemNavigationBarDividerColor: Color(0xffA2C8B5),
        systemNavigationBarIconBrightness: Brightness.dark,
        systemNavigationBarContrastEnforced: true));
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
        toolbarHeight: deviceDiagonal * 0.075,
        backgroundColor: whiteColor,
        title: Text(
          appName,
          style: Theme.of(context)
              .textTheme
              .headline5!
              .merge(TextStyle(color: mainColor)),
        ),
        leading: Container(
            margin: const EdgeInsets.all(10),
            child: Image.asset(Assets.images.pngs.logoCmg.path)),
      ),
      bottomNavigationBar: GetBuilder<HomeLogic>(builder: (logic) {
        return CustomNavBar(
          currentIndex: logic.currentIndex,
          onChange: (value) => logic.onNavPosChange(value),
          itemColor: whiteColor,
          backgroundColor: shadowPrimaryColor,
          children: [
            CustomBottomNavigationItem(
              icon: Icons.home_rounded,
              label: home.tr,
            ),
            CustomBottomNavigationItem(
              icon: Icons.menu_rounded,
              label: more.tr,
            ),
          ],
        );
      }),
      body: GetBuilder<HomeLogic>(builder: (logic) {
        Logger().d("<Attendance>[] :: " + logic.pendingAttendance.length.toString());
        return logic.resultUser != null
            ? PageView(
                children: [
                  logic.resultUser!.code == cmi ? CmiPage() : CmgKhbPage(),
                  MorePage(),
                ],
                onPageChanged: (value) => logic.onPageChange(value),
                controller: logic.pageController,
              )
            : const Center(
                child: SizedBox(
                  child: CircularProgressIndicator(),
                  height: 50.0,
                  width: 50.0,
                ),
              );
      }),
    );
  }
}
