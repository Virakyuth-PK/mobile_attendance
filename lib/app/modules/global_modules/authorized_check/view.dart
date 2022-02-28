import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class AuthorizedCheckPage extends StatelessWidget {
  final logic = Get.find<AuthorizedCheckLogic>();
  final state = Get.find<AuthorizedCheckLogic>().state;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SizedBox(
          child: CircularProgressIndicator(),
          height: 50.0,
          width: 50.0,
        ),
      ),
    );
  }
}
