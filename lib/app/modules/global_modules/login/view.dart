import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

import '../../../../gen/assets.gen.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_decoration.dart';
import '../../../theme/app_text_field_theme.dart';
import '../../../translations/tr_key_word.dart';
import '../../../utils/device_size.dart';
import '../../../utils/key_words.dart';
import 'logic.dart';

class LoginPage extends StatelessWidget {
  final logic = Get.find<LoginLogic>();
  final state = Get.find<LoginLogic>().state;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Color(0xffA2C8B5),
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarDividerColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
        systemNavigationBarContrastEnforced: true));
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: deviceHeight,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: deviceDiagonal * 0.075,
              ),
              Image.asset(
                Assets.images.pngs.logoCmgText.path,
                height: deviceDiagonal * 0.2,
              ),
              SizedBox(
                height: deviceDiagonal * 0.075,
              ),
              Expanded(
                child: Container(
                  padding: screenPaddingHorizontal(),
                  decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10.0),
                        topRight: Radius.circular(10.0)),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${signInTo.tr}\n$appName",
                        style: Theme.of(context).textTheme.headline3!.merge(
                              TextStyle(color: mainColor,fontWeight: FontWeight.bold),
                            ),
                      ),
                      Column(
                        children: [
                          TextField(
                            controller: logic.identifierController,
                            focusNode: logic.identifierFocusNode,
                            textInputAction: TextInputAction.next,
                            maxLines: 1,
                            keyboardType: TextInputType.number,
                            decoration:
                                getTextFieldStyle(hintText: employeeId.tr),
                            style: Theme.of(context).textTheme.headline6,
                          ),
                          SizedBox(
                            height: deviceDiagonal * 0.035,
                          ),
                          Obx(
                            () => TextField(
                              controller: logic.passwordController,
                              focusNode: logic.passwordFocusNode,
                              keyboardType: TextInputType.visiblePassword,
                              textInputAction: TextInputAction.done,
                              maxLines: 1,
                              obscureText: logic.isPasswordObscureText.value,
                              decoration: getPasswordTextFieldStyle(
                                hintText: passwordPortal.tr,
                                suffixIcon: InkWell(
                                  onTap: () =>
                                      logic.isPasswordObscureText.toggle(),
                                  child: Icon(logic.isPasswordObscureText.value
                                      ? Icons.visibility_off
                                      : Icons.visibility),
                                ),
                              ),
                              style: Theme.of(context).textTheme.headline6,
                            ),
                          ),
                        ],
                      ),
                      RoundedLoadingButton(
                        height: deviceDiagonal * 0.05,
                        width: deviceWidth,
                        color: mainColor,
                        errorColor: Colors.red,
                        successColor: mainColor,
                        disabledColor: hintColorLight,
                        borderRadius: 10,
                        valueColor: whiteColor,
                        controller: logic.submitController,
                        onPressed: () {
                          logic.login();
                        },
                        child: Text(
                          login.tr,
                          style: Theme.of(context)
                              .textTheme
                              .headline6!
                              .merge(TextStyle(color: whiteColor)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
