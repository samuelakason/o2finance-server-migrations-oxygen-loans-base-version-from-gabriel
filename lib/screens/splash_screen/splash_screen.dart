// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import 'package:oxygen_loans/config/color_config.dart';

import 'package:oxygen_loans/controllers/auth_controllers/splash_screen_controller.dart';

import 'package:sizer/sizer.dart';

class SplashScreen extends GetView<SplashScreenController> {
  SplashScreen({Key? key}) : super(key: key);
  final loginController = Get.put(SplashScreenController());
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: BoxDecoration(color: oxygenPrimaryColor),
        child: Center(
          child: Image.asset(
            "assets/images/l2.png",
            height: 20.h,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
