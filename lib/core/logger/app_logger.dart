import 'dart:developer';

import 'package:flutter/foundation.dart';

class AppLogger {
  static void logInfo(String message) {
    if (kDebugMode) {
      log("INFO: $message");
    }
  }

  static void logError(String message) {
    if (kDebugMode) {
      log("ERROR: $message");
    }
  }
}
