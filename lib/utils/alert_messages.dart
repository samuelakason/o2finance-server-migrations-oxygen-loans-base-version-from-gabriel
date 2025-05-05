import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:oxygen_loans/services/global_context.dart';

class AlertMessages {
  succesMessage(String title, String message) {
    return Get.snackbar(title, message,
        isDismissible: true,
        shouldIconPulse: true,
        snackPosition: SnackPosition.TOP,
        backgroundColor:
            Theme.of(GlobalContextService.navigatorKey.currentContext!)
                .primaryColor
                .withOpacity(0.5),
        colorText: const Color(0xFFffffff),
        duration: const Duration(seconds: 5));
  }

  erroMessage(String title, String message) {
    return Get.snackbar(title, message,
        isDismissible: true,
        shouldIconPulse: true,
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.redAccent.withOpacity(0.5),
        colorText: const Color(0xFFFFFFFF),
        duration: const Duration(seconds: 5));
  }
}
