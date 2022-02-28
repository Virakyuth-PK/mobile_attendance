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
import 'package:mobile_attendance/app/utils/pop_over.dart';
import 'package:mobile_attendance/gen/assets.gen.dart';


class CmiPage extends StatelessWidget {
  final logic = Get.find<HomeLogic>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: screenPaddingAll(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CustomButton(
            toolTip: checkIn.tr,
            onPress: () => logic.checkAttendance(eventId: f1),
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
                        checkIn.tr,
                        style: Theme.of(context)
                            .textTheme
                            .headline3!
                            .merge(TextStyle(color: mainColor)),
                      ),
                    ],
                  ),
                  Image.asset(
                    Assets.images.pngs.timeF1.path,
                    height: deviceHeight * 0.08,
                  )
                ],
              ),
            ),
          ),
          CustomButton(
              toolTip: "${checkOut.tr} ${withInADay.tr}",
              onPress: () => logic.checkAttendance(eventId: f2),
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
                          checkOut.tr,
                          style: Theme.of(context)
                              .textTheme
                              .headline3!
                              .merge(TextStyle(color: mainColor)),
                        ),
                        SizedBox(
                          height: deviceDiagonal * 0.01,
                        ),
                        Text(
                          withInADay.tr,
                          style: Theme.of(context)
                              .textTheme
                              .headline6!
                              .merge(TextStyle(color: mainColor)),
                        ),
                      ],
                    ),
                    Image.asset(
                      Assets.images.pngs.timeF2.path,
                      height: deviceHeight * 0.08,
                    )
                  ],
                ),
              )),
          CustomButton(
            toolTip: "${checkOut.tr} ${forTheNextDay.tr}",
            onPress: () => logic.checkAttendance(eventId: f3),
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
                        checkOut.tr,
                        style: Theme.of(context)
                            .textTheme
                            .headline3!
                            .merge(TextStyle(color: mainColor)),
                      ),
                      SizedBox(
                        height: deviceDiagonal * 0.01,
                      ),
                      Text(
                        forTheNextDay.tr,
                        style: Theme.of(context)
                            .textTheme
                            .headline6!
                            .merge(TextStyle(color: mainColor)),
                      ),
                    ],
                  ),
                  Image.asset(
                    Assets.images.pngs.timeF3.path,
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