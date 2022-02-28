import 'dart:io';

import 'package:logger/logger.dart';

checkConnection() async {
  try {
    final result = await InternetAddress.lookup('google.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      Logger().i('connected');
      return true;
    }
  } on SocketException catch (_) {
    Logger().e('not connected');
    return false;
  }
}
