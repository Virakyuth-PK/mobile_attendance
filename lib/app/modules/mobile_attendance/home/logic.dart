import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:geocoding/geocoding.dart' as Geocoding;
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:location/location.dart';
import 'package:logger/logger.dart';
import 'package:mobile_attendance/app/data/api/api_service.dart';
import 'package:mobile_attendance/app/data/api/api_url.dart';
import 'package:mobile_attendance/app/data/delete_all.dart';
import 'package:mobile_attendance/app/data/local/converter/attendance_converter.dart';
import 'package:mobile_attendance/app/data/local/manager/db_manager.dart';
import 'package:mobile_attendance/app/data/local/storage/language.dart';
import 'package:mobile_attendance/app/model/request/check_attendance/check_attendance_body.dart';
import 'package:mobile_attendance/app/model/request/get_attendance_report/get_attendance_report_body.dart';
import 'package:mobile_attendance/app/model/response/response_mobile_publish/response_mobile_publish.dart';
import 'package:mobile_attendance/app/modules/global_modules/login/binding.dart';
import 'package:mobile_attendance/app/modules/global_modules/login/view.dart';
import 'package:mobile_attendance/app/theme/app_colors.dart';
import 'package:mobile_attendance/app/theme/app_decoration.dart';
import 'package:mobile_attendance/app/translations/tr_key_word.dart';
import 'package:mobile_attendance/app/utils/check_connection.dart';
import 'package:mobile_attendance/app/utils/custom_bottom_sheet.dart';
import 'package:mobile_attendance/app/utils/custom_button.dart';
import 'package:mobile_attendance/app/utils/custom_snack_bar.dart';
import 'package:mobile_attendance/app/utils/device_size.dart';
import 'package:mobile_attendance/app/utils/key_words.dart';
import 'package:mobile_attendance/app/utils/service.dart';
import 'package:mobile_attendance/gen/assets.gen.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import 'state.dart';

class HomeLogic extends GetxController {
  final HomeState state = HomeState();
  var pageController = PageController();
  User? resultUser;
  var currentIndex = 0;
  PackageInfo? packageInfo;
  List<Attendance> pendingAttendance = <Attendance>[];

  @override
  void onInit() async {
    super.onInit();
    packageInfo = await PackageInfo.fromPlatform();
    Logger().wtf(packageInfo!.version);
    resultUser = await locator<AppDatabase>().getUser();
    pendingAttendance = await locator<AppDatabase>().getAttendance();
    update();
  }

  onNavPosChange(int value) {
    currentIndex = value;
    pageController.animateToPage(value,
        curve: Curves.easeInOut, duration: const Duration(microseconds: 1));
    update();
  }

  onPageChange(int value) {
    currentIndex = value;
    update();
  }

  changeLanguage() {
    if (Get.locale == Locale(englishCode)) {
      writeLanguage(khmerCode);
      Get.updateLocale(Locale(khmerCode));
    } else {
      writeLanguage(englishCode);
      Get.updateLocale(Locale(englishCode));
    }
  }

  checkVersion() async {
    var requestVersionBuild = ResponseMobilePublish(
        build: int.parse(packageInfo!.buildNumber),
        version: packageInfo!.version);

    await ApiService().mobilePublishCheckUpdate(
      onSuccess: (result) async {
        Logger().e(result.version != requestVersionBuild.version);
        Logger().e(result.version);
        Logger().e(requestVersionBuild.version);
        if (result.version != requestVersionBuild.version) {
          await showDialog(
            // barrierDismissible: result.isForce == false,
            context: Get.overlayContext!,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text("Update"),
                content: const Text("Click open to download a new version"),
                actions: [
                  result.isForce == false
                      ? TextButton(
                          child: Text(
                            "Cancel",
                            style: Theme.of(context).textTheme.caption!.merge(
                                  TextStyle(color: mainColor),
                                ),
                          ),
                          onPressed: () async {
                            Get.back();
                          },
                        )
                      : const SizedBox.shrink(),
                  TextButton(
                    child: Text("Open",
                        style: Theme.of(context).textTheme.button!.merge(
                              TextStyle(color: mainColor),
                            )),
                    onPressed: () async {
                      Get.back();
                      await canLaunch(appStoreURL)
                          ? await launch(appStoreURL)
                          : customSnackBar(
                              message: 'Could not launch $appStoreURL',
                              colorText: mainColor,
                              icon: Icons.close_rounded,
                              title: sorry.tr,
                              backgroundColor: Colors.red);
                    },
                  ),
                ],
              );
            },
          );
        }
      },
    );
  }

  logout() async {
    await deleteAllData();
    Get.offAll(() => LoginPage(), binding: LoginBinding());
  }

  checkAttendance({required eventId, function}) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    await EasyLoading.show(
        status: checkingYourLocation.tr, maskType: EasyLoadingMaskType.black);
    var connectionResult = await checkConnection();
    var userIMEI = "";
    var deviceInfo = DeviceInfoPlugin();
    if (Platform.isIOS) {
      var iosDeviceInfo = await deviceInfo.iosInfo;
      userIMEI = iosDeviceInfo.identifierForVendor!;
    } else {
      var androidDeviceInfo = await deviceInfo.androidInfo;
      userIMEI = androidDeviceInfo.androidId!;
    }
    LocationData? _locationData = await getLocation();
    if (_locationData == null || connectionResult == false) {
      await EasyLoading.showError(cannotGetLocation.tr,
          maskType: EasyLoadingMaskType.black);
    }
    List<Geocoding.Placemark> placemarks = <Geocoding.Placemark>[];
    if (connectivityResult != ConnectivityResult.none &&
        connectionResult == true) {
      Logger().e(connectivityResult);
      placemarks = await Geocoding.placemarkFromCoordinates(
          _locationData!.latitude!, _locationData.longitude!);
    }

    String code = "";

    if (resultUser!.code != cmi) {
      code = cmg;
    } else {
      code = resultUser!.code;
    }
    CheckAttendanceBody checkAttendanceBody = CheckAttendanceBody(
        staffId: resultUser!.staffId,
        latitude: _locationData!.latitude!,
        longitude: _locationData.longitude!,
        dateTime: DateTime.now(),
        eventID: eventId,
        address: placemarks.isNotEmpty
            ? placemarks.first.street! +
                placemarks.first.subLocality! +
                "," +
                placemarks.first.subAdministrativeArea! +
                "," +
                placemarks.first.administrativeArea! +
                "," +
                placemarks.first.country!
            : "",
        imei: userIMEI,
        comCode: code);

    if (_locationData == null || connectionResult == false) {
      await EasyLoading.showError(cannotGetLocation.tr,
          maskType: EasyLoadingMaskType.black);
      await locator<AppDatabase>().insertAttendance(
        converterAttendanceJson(
          checkAttendanceBody,
          reason: "$cannotGetLocation ${DateTime.now()}",
        ),
      );
      pendingAttendance = await locator<AppDatabase>().getAttendance();
      update();
      return;
    }

    if (connectivityResult == ConnectivityResult.none ||
        connectionResult == false) {
      await locator<AppDatabase>().insertAttendance(
        converterAttendanceJson(
          checkAttendanceBody,
          reason: "Connection Time Out! ${DateTime.now()}",
        ),
      );
    } else {
      await ApiService().checkAttendance(
          onSuccess: (data) async {
            await ApiService().getAttendance(
                onSuccess: (data) {
                  customBottomSheet(
                      child: Container(
                    padding: screenPaddingAll(),
                    child: CustomButton(
                      toolTip: personalAttendance.tr,
                      onPress: () => null,
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
                                  DateFormat("dd.MM.yyyy")
                                      .format(data.data.first.firstTimeIN!),
                                  style: Theme.of(Get.context!)
                                      .textTheme
                                      .headline5!
                                      .merge(TextStyle(color: mainColor)),
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.end,
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
                                      DateFormat("HH:mm")
                                          .format(data.data.first.firstTimeIN!),
                                      style: Theme.of(Get.context!)
                                          .textTheme
                                          .headline6!
                                          .merge(TextStyle(color: mainColor)),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Image.asset(
                                      Assets.images.pngs.timeOut.path,
                                      height: deviceHeight * 0.025,
                                    ),
                                    SizedBox(
                                      width: deviceDiagonal * 0.01,
                                    ),
                                    Text(
                                      DateFormat("HH:mm")
                                          .format(data.data.first.lastTimeOUT!),
                                      style: Theme.of(Get.context!)
                                          .textTheme
                                          .headline6!
                                          .merge(TextStyle(color: mainColor)),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: deviceDiagonal * 0.01,
                                ),
                                GetBuilder<HomeLogic>(builder: (logic) {
                                  var status = "";
                                  if (data.data.first.status == early) {
                                    status = early.tr;
                                  } else if (data.data.first.status == onTime) {
                                    status = onTime.tr;
                                  } else if (data.data.first.status == late) {
                                    status = late.tr;
                                  }
                                  return Text(
                                    status,
                                    style: Theme.of(Get.context!)
                                        .textTheme
                                        .headline6!
                                        .merge(TextStyle(color: mainColor)),
                                  );
                                }),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ));
                },
                data: GetAttendanceReportBody(
                    comCode: code,
                    staffId: resultUser!.staffId,
                    fromDate: DateTime.now(),
                    toDate: DateTime.now()));
          },
          data: checkAttendanceBody);
    }
  }

  Future<LocationData?> getLocation() async {
    Location location = Location();

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        Logger().e(_serviceEnabled);
        return null;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        Logger().e(_permissionGranted);
        return null;
      }
    }

    var locationData = await location.getLocation();

    return locationData;
  }
}
