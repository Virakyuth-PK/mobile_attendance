import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_attendance/app/modules/mobile_attendance/attendance_report/binding.dart';
import 'package:mobile_attendance/app/modules/mobile_attendance/attendance_report/view.dart';
import 'package:mobile_attendance/app/modules/mobile_attendance/home/logic.dart';
import 'package:mobile_attendance/app/theme/app_colors.dart';
import 'package:mobile_attendance/app/theme/app_decoration.dart';
import 'package:mobile_attendance/app/translations/tr_key_word.dart';
import 'package:mobile_attendance/app/utils/custom_button.dart';
import 'package:mobile_attendance/app/utils/device_size.dart';
import 'package:mobile_attendance/app/utils/key_words.dart';
import 'package:mobile_attendance/gen/assets.gen.dart';

class CmgKhbPage extends StatelessWidget {
  final logic = Get.find<HomeLogic>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: screenPaddingAll(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CustomButton(
              toolTip: "${scan.tr} ${qrCode.tr} ${comingSoon.tr}",
              onPress: () => {},
              child: Stack(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: deviceWidth * 0.04,
                        vertical: deviceHeight * 0.025),
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
                              scan.tr,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline3!
                                  .merge(TextStyle(color: mainColor)),
                            ),
                            SizedBox(
                              height: deviceDiagonal * 0.01,
                            ),
                            Text(
                              qrCode.tr,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6!
                                  .merge(TextStyle(color: mainColor)),
                            ),
                          ],
                        ),
                        Image.asset(
                          Assets.images.pngs.idCard.path,
                          height: deviceHeight * 0.08,
                        )
                      ],
                    ),
                  ),
                  Positioned.fill(
                    child: Opacity(
                      opacity: 0.85,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: deviceWidth * 0.04,
                            vertical: deviceHeight * 0.01),
                        decoration:
                            containerDecoration(fillColor: grey300Color),
                        child: Center(
                          child: Text(
                            comingSoon.tr,
                            style: Theme.of(context)
                                .textTheme
                                .headline5!
                                .merge(const TextStyle(color: Colors.red)),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )),
          CustomButton(
            toolTip: "${manualInput.tr} ${saleAgentId.tr}",
            onPress: () => {},
            child: Stack(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: deviceWidth * 0.04,
                      vertical: deviceHeight * 0.025),
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
                            manualInput.tr,
                            style: Theme.of(context)
                                .textTheme
                                .headline3!
                                .merge(TextStyle(color: mainColor)),
                          ),
                          SizedBox(
                            height: deviceDiagonal * 0.01,
                          ),
                          Text(
                            saleAgentId.tr,
                            style: Theme.of(context)
                                .textTheme
                                .headline6!
                                .merge(TextStyle(color: mainColor)),
                          ),
                        ],
                      ),
                      Image.asset(
                        Assets.images.pngs.inputPhone.path,
                        height: deviceHeight * 0.08,
                      )
                    ],
                  ),
                ),
                Positioned.fill(
                  child: Opacity(
                    opacity: 0.85,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: deviceWidth * 0.04,
                          vertical: deviceHeight * 0.01),
                      decoration:
                      containerDecoration(fillColor: grey300Color),
                      child: Center(
                        child: Text(
                          comingSoon.tr,
                          style: Theme.of(context)
                              .textTheme
                              .headline5!
                              .merge(const TextStyle(color: Colors.red)),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          CustomButton(
            toolTip: "${checkInOut.tr} ${personalAttendance.tr}",
            onPress: () => logic.checkAttendance(eventId: self),
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: deviceWidth * 0.04,
                  vertical: deviceHeight * 0.025),
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
                        checkInOut.tr,
                        style: Theme.of(context)
                            .textTheme
                            .headline3!
                            .merge(TextStyle(color: mainColor)),
                      ),
                      SizedBox(
                        height: deviceDiagonal * 0.01,
                      ),
                      Text(
                        personalAttendance.tr,
                        style: Theme.of(context)
                            .textTheme
                            .headline6!
                            .merge(TextStyle(color: mainColor)),
                      ),
                    ],
                  ),
                  Image.asset(
                    Assets.images.pngs.time.path,
                    height: deviceHeight * 0.08,
                  )
                ],
              ),
            ),
          ),
          CustomButton(
            toolTip: "${view.tr} ${attendanceReport.tr}",
            onPress: () => Get.to(() => AttendanceReportPage(),
                binding: AttendanceReportBinding()),
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: deviceWidth * 0.04,
                  vertical: deviceHeight * 0.025),
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
                        view.tr,
                        style: Theme.of(context)
                            .textTheme
                            .headline3!
                            .merge(TextStyle(color: mainColor)),
                      ),
                      SizedBox(
                        height: deviceDiagonal * 0.01,
                      ),
                      Text(
                        attendanceReport.tr,
                        style: Theme.of(context)
                            .textTheme
                            .headline6!
                            .merge(TextStyle(color: mainColor)),
                      ),
                    ],
                  ),
                  Image.asset(
                    Assets.images.pngs.paper.path,
                    height: deviceHeight * 0.08,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
