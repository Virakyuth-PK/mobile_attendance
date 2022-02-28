import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_attendance/app/utils/custom_button.dart';
import 'package:mobile_attendance/gen/fonts.gen.dart';

import '../../../../gen/assets.gen.dart';
import '../../../utils/device_size.dart';
import '../../../utils/key_words.dart';
import 'logic.dart';

class LanguagePage extends StatelessWidget {
  final logic = Get.find<LanguageLogic>();
  final state = Get.find<LanguageLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            Assets.images.pngs.logoCmgText.path,
            height: deviceDiagonal * 0.2,
          ),
          SizedBox(
            height: deviceDiagonal * 0.1,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomButton(
                toolTip: khmer,
                onPress: () => logic.selectLocale(khmerCode),
                child: Column(
                  children: [
                    Image.asset(
                      Assets.images.pngs.cambodiaRound.path,
                      height: deviceDiagonal * 0.075,
                    ),
                    SizedBox(
                      height: deviceDiagonal * 0.01,
                    ),
                    Text(
                      khmer,
                      style: Theme.of(context).textTheme.headline6!.merge(
                          const TextStyle(
                              fontFamily: FontFamily.nokora, fontSize: 25.0)),
                    )
                  ],
                ),
              ),
              CustomButton(
                toolTip: english,
                onPress: () => logic.selectLocale(englishCode),
                child: Column(
                  children: [
                    Image.asset(
                      Assets.images.pngs.englandRound.path,
                      height: deviceDiagonal * 0.075,
                    ),
                    SizedBox(
                      height: deviceDiagonal * 0.01,
                    ),
                    Text(
                      english,
                      style: Theme.of(context).textTheme.headline5!.merge(
                          const TextStyle(fontFamily: FontFamily.montserrat)),
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
