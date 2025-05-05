import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:oxygen_loans/bottom_nav_layout.dart';
import 'package:oxygen_loans/config/oxygen.dart';

class CreatePinController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  getDigits(String pin) async {
    await OxygenApp.sharedPreferences!.setString(OxygenApp.localPin, pin);
    Get.snackbar(
        'Succesful!', "Your application pin has been saved succesfully",
        isDismissible: true,
        shouldIconPulse: true,
        snackPosition: SnackPosition.TOP,
        colorText: Color(0xFF000000),
        duration: const Duration(seconds: 5));
    Get.off(() => MainScreen(sIndex: 0),
        duration: const Duration(seconds: 2),
        transition: Transition.circularReveal);
  }
}
