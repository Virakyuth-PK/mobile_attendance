import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mobile_attendance/app/modules/mobile_attendance/home/logic.dart';
import 'package:mobile_attendance/app/theme/app_colors.dart';
import 'package:mobile_attendance/app/theme/app_decoration.dart';
import 'package:mobile_attendance/app/translations/tr_key_word.dart';
import 'package:mobile_attendance/app/utils/custom_button.dart';
import 'package:mobile_attendance/app/utils/device_size.dart';

import 'logic.dart';

class PendingAttendanceReportPage extends StatelessWidget {
  final logic = Get.find<PendingAttendanceReportLogic>();
  final state = Get.find<PendingAttendanceReportLogic>().state;

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
        child: Stack(
          alignment: const Alignment(0, 1),
          children: [
            Column(
              children: [
                Text(
                  resendOrRemoved.tr,
                  style: Theme.of(context).textTheme.headline6!.merge(
                        TextStyle(color: whiteColor),
                      ),
                ),
                SizedBox(
                  height: deviceDiagonal * 0.025,
                ),
                GetBuilder<HomeLogic>(builder: (logic) {
                  if (logic.pendingAttendance.isEmpty) {
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
                      child: GetBuilder<PendingAttendanceReportLogic>(builder: (logic) {
                        return ListView.builder(
                          itemCount: logic.pendingAttendance.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                CustomButton(
                                  toolTip: logic.pendingAttendance[index].reason,
                                  onPress: () => logic.checkBoxOnChange(!logic.isChecked[index], index),
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: deviceWidth * 0.04,
                                        vertical: deviceHeight * 0.035),
                                    decoration: containerDecoration(),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
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
                                              logic.pendingAttendance[index]
                                                  .staffId,
                                              style: Theme.of(Get.context!)
                                                  .textTheme
                                                  .headline5!
                                                  .merge(TextStyle(
                                                      color: mainColor)),
                                            ),
                                            SizedBox(
                                              height: deviceDiagonal * 0.01,
                                            ),
                                            Text(
                                              DateFormat("dd.MM.yyyy | HH:mm a")
                                                  .format(logic
                                                      .pendingAttendance[index]
                                                      .dateTimeAttendance),
                                              style: Theme.of(Get.context!)
                                                  .textTheme
                                                  .headline6!
                                                  .merge(TextStyle(
                                                      color: mainColor)),
                                            ),
                                          ],
                                        ),
                                        Checkbox(
                                          value: logic.isChecked[index],
                                          onChanged: (value) => logic.checkBoxOnChange(value!, index),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                logic.pendingAttendance.length - 1 != index
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: CustomButton(
                      toolTip: "Resend",
                      onPress: () => logic.reSend(),
                      child: Container(
                        height: 50,
                        decoration: containerDecoration(fillColor: mainColor),
                        child: Center(
                          child: Text(
                            "Resend",
                            style: Theme.of(context)
                                .textTheme
                                .headline6!
                                .merge(TextStyle(color: whiteColor)),
                          ),
                        ),
                      )),
                ),
                SizedBox(
                  width: deviceDiagonal * 0.025,
                ),
                Expanded(
                  child: CustomButton(
                      toolTip: "Remove",
                      onPress: () => logic.removePending(),
                      child: Container(
                        height: 50,
                        decoration: containerDecoration(fillColor: Colors.red),
                        child: Center(
                          child: Text(
                            "Remove",
                            style: Theme.of(context)
                                .textTheme
                                .headline6!
                                .merge(TextStyle(color: whiteColor)),
                          ),
                        ),
                      )),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
