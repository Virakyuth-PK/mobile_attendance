import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

import '../../../data/api/api_service.dart';
import '../../../model/request/login/login_body.dart';
import '../../../theme/app_colors.dart';
import '../../../translations/tr_key_word.dart';
import '../../../utils/custom_snack_bar.dart';
import '../../mobile_attendance/home/binding.dart';
import '../../mobile_attendance/home/view.dart';
import 'state.dart';

class LoginLogic extends GetxController {
  final LoginState state = LoginState();

  var identifierController = TextEditingController();
  var passwordController = TextEditingController();
  var submitController = RoundedLoadingButtonController();
  var isPasswordObscureText = true.obs;
  var passwordFocusNode = FocusNode();
  var identifierFocusNode = FocusNode();

  Future<void> login() async {
    if (identifierFocusNode.hasFocus) {
      identifierFocusNode.unfocus();
    }
    if (passwordFocusNode.hasFocus) {
      passwordFocusNode.unfocus();
    }

    if (identifierController.text.isEmpty) {
      submitController.stop();
      customSnackBar(
          message: identifierEmpty.tr,
          colorText: Colors.red,
          backgroundColor: whiteColor,
          title: sorry.tr,
          icon: Icons.error);
      return;
    }
    if (passwordController.text.isEmpty) {
      submitController.stop();
      customSnackBar(
          message: passwordEmpty.tr,
          colorText: Colors.red,
          backgroundColor: whiteColor,
          title: sorry.tr,
          icon: Icons.error);
      return;
    }

    await ApiService().login(
      onSuccess: (data) async {
        submitController.success();
        await 1.delay();
        submitController.reset();
        Get.offAll(() => HomePage(), binding: HomeBinding());
      },
      data: LoginBody(identifierController.text, passwordController.text),
      onError: (error) async {
        submitController.error();
        await 1.delay();
        submitController.reset();
      },
    );
  }
}
