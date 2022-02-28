import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_attendance/app/modules/mobile_attendance/home/logic.dart';
import 'package:mobile_attendance/app/modules/mobile_attendance/pending_attendance_report/binding.dart';
import 'package:mobile_attendance/app/modules/mobile_attendance/pending_attendance_report/view.dart';
import 'package:mobile_attendance/app/theme/app_colors.dart';
import 'package:mobile_attendance/app/theme/app_decoration.dart';
import 'package:mobile_attendance/app/translations/tr_key_word.dart';
import 'package:mobile_attendance/app/utils/custom_bottom_sheet.dart';
import 'package:mobile_attendance/app/utils/custom_button.dart';
import 'package:mobile_attendance/app/utils/device_size.dart';
import 'package:mobile_attendance/app/utils/key_words.dart';

class MorePage extends StatelessWidget {
  final logic = Get.find<HomeLogic>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: screenPaddingAll(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: deviceDiagonal * 0.015,
          ),
          CustomButton(
            toolTip: pendingReport.tr,
            onPress: () =>
                Get.to(() => PendingAttendanceReportPage(),
                    binding: PendingAttendanceReportBinding()),
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: deviceWidth * 0.04,
                  vertical: deviceHeight * 0.035),
              decoration: containerDecoration(),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        pendingReport.tr,
                        style: Theme
                            .of(context)
                            .textTheme
                            .headline5!
                            .merge(
                          TextStyle(color: mainColor),
                        ),
                      ),
                    ],
                  ),
                  GetBuilder<HomeLogic>(builder: (logic) {
                    return Text(
                      logic.pendingAttendance.length.toString(),
                      style: Theme
                          .of(context)
                          .textTheme
                          .headline6!
                          .merge(const TextStyle(color: Colors.red)),
                    );
                  }),
                ],
              ),
            ),
          ),
          SizedBox(
            height: deviceDiagonal * 0.025,
          ),
          CustomButton(
            toolTip: language.tr,
            onPress: () => logic.changeLanguage(),
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: deviceWidth * 0.04,
                  vertical: deviceHeight * 0.035),
              decoration: containerDecoration(),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        language.tr,
                        style: Theme
                            .of(context)
                            .textTheme
                            .headline5!
                            .merge(TextStyle(color: mainColor)),
                      ),
                    ],
                  ),
                  Text(
                    Get.locale != null && Get.locale == Locale(khmerCode)
                        ? khmer
                        : english,
                    style: Theme
                        .of(context)
                        .textTheme
                        .headline6!
                        .merge(const TextStyle(color: Colors.red)),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: deviceDiagonal * 0.025,
          ),
          CustomButton(
            toolTip: accountInfo.tr,
            onPress: () =>
                customBottomSheet(
                  child: Container(
                    padding: screenPaddingAll(),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "${employeeId.tr} : ",
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .headline6!
                                  .merge(TextStyle(color: mainColor)),
                            ),
                            Text(
                              logic.resultUser!.staffId,
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .headline6!
                                  .merge(TextStyle(color: mainColor)),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery
                              .of(context)
                              .size
                              .height * 0.025,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "${name.tr} : ",
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .headline6!
                                  .merge(TextStyle(color: mainColor)),
                            ),
                            Flexible(
                              child: Text(
                                logic.resultUser!.name,
                                style: Theme
                                    .of(context)
                                    .textTheme
                                    .headline6!
                                    .merge(TextStyle(color: mainColor)),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery
                              .of(context)
                              .size
                              .height * 0.025,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${role.tr} : ",
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .headline6!
                                  .merge(TextStyle(color: mainColor)),
                            ),
                            Flexible(
                              child: Text(
                                logic.resultUser!.role,
                                style: Theme
                                    .of(context)
                                    .textTheme
                                    .headline6!
                                    .merge(TextStyle(color: mainColor)),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery
                              .of(context)
                              .size
                              .height * 0.025,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${department.tr} : ",
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .headline6!
                                  .merge(TextStyle(color: mainColor)),
                            ),
                            Flexible(
                              child: Text(
                                logic.resultUser!.department,
                                style: Theme
                                    .of(context)
                                    .textTheme
                                    .headline6!
                                    .merge(TextStyle(color: mainColor)),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: deviceWidth * 0.04,
                  vertical: deviceHeight * 0.035),
              decoration: containerDecoration(),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        accountInfo.tr,
                        style: Theme
                            .of(context)
                            .textTheme
                            .headline5!
                            .merge(TextStyle(color: mainColor)),
                      ),
                    ],
                  ),
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: mainColor,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: deviceDiagonal * 0.025,
          ),
          CustomButton(
            toolTip: checkVersion.tr,
            onPress: () => logic.checkVersion(),
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: deviceWidth * 0.04,
                  vertical: deviceHeight * 0.035),
              decoration: containerDecoration(),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        checkVersion.tr,
                        style: Theme
                            .of(context)
                            .textTheme
                            .headline5!
                            .merge(TextStyle(color: mainColor)),
                      ),
                    ],
                  ),
                  Text(
                    "v ${logic.packageInfo!.version}",
                    style: Theme
                        .of(context)
                        .textTheme
                        .headline6!
                        .merge(const TextStyle(color: Colors.red)),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: deviceDiagonal * 0.025,
          ),
          CustomButton(
            toolTip: logout.tr,
            onPress: () => logic.logout(),
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: deviceWidth * 0.04,
                  vertical: deviceHeight * 0.035),
              decoration: containerDecoration(),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        logout.tr,
                        style: Theme
                            .of(context)
                            .textTheme
                            .headline5!
                            .merge(TextStyle(color: mainColor)),
                      ),
                    ],
                  ),
                  Icon(
                    Icons.logout,
                    color: mainColor,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
