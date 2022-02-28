import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';
import 'package:mobile_attendance/app/theme/app_colors.dart';
import 'package:mobile_attendance/app/theme/app_decoration.dart';
import 'package:mobile_attendance/app/translations/tr_key_word.dart';
import 'package:mobile_attendance/app/utils/custom_button.dart';
import 'package:mobile_attendance/app/utils/device_size.dart';
import 'package:mobile_attendance/gen/assets.gen.dart';

import 'logic.dart';

class AttendanceReportPage extends StatelessWidget {
  final logic = Get.find<AttendanceReportLogic>();
  final state = Get.find<AttendanceReportLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: mainColor,
        ),
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
        toolbarHeight: deviceDiagonal * 0.075,
        backgroundColor: whiteColor,
        title: Text(
          back.tr,
          style: Theme.of(context)
              .textTheme
              .headline6!
              .merge(TextStyle(color: mainColor)),
        ),
      ),
      body: Container(
        width: double.infinity,
        padding: screenPaddingAll(),
        child: Column(
          children: [
            Text(
              selectStartEndDate.tr,
              style: Theme.of(context).textTheme.headline5!.merge(
                    TextStyle(color: whiteColor),
                  ),
            ),
            SizedBox(
              height: deviceDiagonal * 0.025,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomButton(
                  child: Container(
                    decoration: containerDecoration(),
                    padding: EdgeInsets.symmetric(
                        horizontal: deviceWidth * 0.04,
                        vertical: deviceHeight * 0.015),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GetBuilder<AttendanceReportLogic>(builder: (logic) {
                          return Text(
                            DateFormat("dd.MM.yyyy").format(logic.startDate),
                            style: Theme.of(context).textTheme.headline6!.merge(
                                  TextStyle(color: shadowPrimaryColor),
                                ),
                          );
                        }),
                        SizedBox(
                          width: deviceDiagonal * 0.01,
                        ),
                        Icon(
                          Icons.date_range_rounded,
                          color: shadowPrimaryColor,
                        )
                      ],
                    ),
                  ),
                  toolTip: selectStartDate.tr,
                  onPress: () => logic.openDatePicker(isStartDate: true),
                ),
                SizedBox(
                  width: deviceDiagonal * 0.01,
                ),
                CustomButton(
                  child: Container(
                    decoration: containerDecoration(),
                    padding: EdgeInsets.symmetric(
                        horizontal: deviceWidth * 0.04,
                        vertical: deviceHeight * 0.015),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GetBuilder<AttendanceReportLogic>(builder: (logic) {
                          return Text(
                            DateFormat("dd.MM.yyyy").format(logic.endDate),
                            style: Theme.of(context).textTheme.headline6!.merge(
                                  TextStyle(color: shadowPrimaryColor),
                                ),
                          );
                        }),
                        SizedBox(
                          width: deviceDiagonal * 0.01,
                        ),
                        Icon(
                          Icons.date_range_rounded,
                          color: shadowPrimaryColor,
                        )
                      ],
                    ),
                  ),
                  toolTip: selectEndDate.tr,
                  onPress: () => logic.openDatePicker(isStartDate: false),
                ),
                SizedBox(
                  width: deviceDiagonal * 0.01,
                ),
                CustomButton(
                  toolTip: "Search",
                  onPress: () => logic.getReport(),
                  child: Container(
                    padding: const EdgeInsets.all(7.5),
                    decoration: containerDecoration(
                        borderRadius: BorderRadius.circular(100.0)),
                    child: Icon(
                      Icons.search_rounded,
                      color: mainColor,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: deviceDiagonal * 0.05,
            ),
            GetBuilder<AttendanceReportLogic>(builder: (logic) {
              if (logic.listAttendance.isEmpty) {
                return Expanded(
                  child: Center(
                    child: Text(
                      noDataReceived.tr,
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .merge(TextStyle(color: whiteColor)),
                    ),
                  ),
                );
              } else {
                return Expanded(
                  child: GetBuilder<AttendanceReportLogic>(builder: (logic) {
                    return ListView.builder(
                      itemCount: logic.listAttendance.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            CustomButton(
                              toolTip: personalAttendance.tr,
                              onPress: () => null,
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: deviceWidth * 0.04,
                                    vertical: deviceHeight * 0.035),
                                decoration: containerDecoration(),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          DateFormat("dd.MM.yyyy").format(logic
                                              .listAttendance[index]
                                              .firstTimeIN!),
                                          style: Theme.of(Get.context!)
                                              .textTheme
                                              .headline5!
                                              .merge(
                                                  TextStyle(color: mainColor)),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Row(
                                          children: [
                                            Image.asset(
                                              Assets.images.pngs.timeIn.path,
                                              height: deviceHeight * 0.025,
                                            ),
                                            SizedBox(
                                              width: deviceDiagonal * 0.01,
                                            ),
                                            Text(
                                              DateFormat("HH:mm").format(logic
                                                  .listAttendance[index]
                                                  .firstTimeIN!),
                                              style: Theme.of(Get.context!)
                                                  .textTheme
                                                  .headline6!
                                                  .merge(TextStyle(
                                                      color: mainColor)),
                                            ),
                                          ],
                                        ),
                                        logic.listAttendance[index]
                                                    .lastTimeOUT !=
                                                null
                                            ? Row(
                                                children: [
                                                  Image.asset(
                                                    Assets.images.pngs.timeOut
                                                        .path,
                                                    height:
                                                        deviceHeight * 0.025,
                                                  ),
                                                  SizedBox(
                                                    width: deviceDiagonal * 0.01,
                                                  ),
                                                  Text(
                                                    DateFormat("HH:mm").format(
                                                        logic
                                                            .listAttendance[index]
                                                            .lastTimeOUT!),
                                                    style:
                                                        Theme.of(Get.context!)
                                                            .textTheme
                                                            .headline6!
                                                            .merge(TextStyle(
                                                                color:
                                                                    mainColor)),
                                                  ),
                                                ],
                                              )
                                            : const SizedBox.shrink(),
                                        SizedBox(
                                          height: deviceDiagonal * 0.01,
                                        ),
                                        GetBuilder<AttendanceReportLogic>(
                                            builder: (logic) {
                                          var status = "";
                                          if (logic.resultAttendance!
                                                  .data[index].status ==
                                              early) {
                                            status = early.tr;
                                          } else if (logic.resultAttendance!
                                                  .data[index].status ==
                                              onTime) {
                                            status = onTime.tr;
                                          } else if (logic.resultAttendance!
                                                  .data[index].status ==
                                              late) {
                                            status = late.tr;
                                          }
                                          return Text(
                                            status,
                                            textAlign: TextAlign.end,
                                            style: Theme.of(Get.context!)
                                                .textTheme
                                                .headline6!
                                                .merge(TextStyle(
                                                    color: mainColor)),
                                          );
                                        }),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            logic.listAttendance.length-1 != index
                                ? SizedBox(
                                    height: deviceDiagonal * 0.025,
                                  )
                                : const SizedBox.shrink()
                          ],
                        );
                      },
                    );
                  }),
                );
              }
            }),
          ],
        ),
      ),
    );
  }
}
