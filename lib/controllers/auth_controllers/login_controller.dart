import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:oxygen_loans/bottom_nav_layout.dart';
import 'package:oxygen_loans/config/http_client.dart';
import 'package:oxygen_loans/config/oxygen.dart';
import 'package:oxygen_loans/models/auth/user.dart';
import 'package:oxygen_loans/repositories/aurh.dart';
import 'package:oxygen_loans/screens/auth/create_pin.dart';
import 'package:oxygen_loans/screens/auth/verify_eamil.dart';
import 'package:oxygen_loans/screens/dashboard/dashboard.dart';
import 'package:oxygen_loans/screens/widgets/loaders.dart';
import 'package:oxygen_loans/services/app_exceptions.dart';
import 'package:oxygen_loans/services/global_context.dart';
import 'package:oxygen_loans/shared_widgets/loader.dart';
import 'package:oxygen_loans/utils/alert_messages.dart';
import 'package:sizer/sizer.dart';

class LoginController extends GetxController {
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  var email = '';
  var password = '';
  var isRegistering = false;
  bool isObscure = true;
  AuthRepository authRepository = AuthRepository(
    userToken: AppHttpClient.getCurentToken(),
    client: AppHttpClient.getHttpClient(),
  );
  login() async {
    Loadericons().preloader(GlobalContextService.navigatorKey.currentContext!);
    try {
      final response = await authRepository.login(emailController.text.trim(),
          passwordController.text.trim(), "deviceName");
      await saveToPrefs(response);
      Navigator.pop(GlobalContextService.navigatorKey.currentContext!);
      Get.offAll(() => MainScreen(sIndex: 0),
          duration: const Duration(milliseconds: 1000),
          transition: Transition.rightToLeft);
    } catch (e) {
      print(e);
      Navigator.pop(GlobalContextService.navigatorKey.currentContext!);
      if (e == FetchDataException) {
        AlertMessages().erroMessage("Network Error!",
            "Please check your internet connection. A network error has occurred");
      } else {
        var responsError = jsonDecode(e.toString());
        print(responsError);
        AlertMessages().erroMessage("Error!", responsError['message']);
      }
    }
  }

  Future<void> saveToPrefs(UserModel userModel) async {
    await OxygenApp.sharedPreferences!
        .setString(OxygenApp.firstName, userModel.data!.firstName!);
    await OxygenApp.sharedPreferences!
        .setString(OxygenApp.lastName, userModel.data!.lastName!);

    await OxygenApp.sharedPreferences!
        .setString(OxygenApp.email, userModel.data!.email!);
    await OxygenApp.sharedPreferences!.setString(OxygenApp.referrer, "");
    await OxygenApp.sharedPreferences!
        .setString(OxygenApp.phoneNumber, userModel.data!.phoneNumber!);
    // await OxygenApp.sharedPreferences!
    //     .setString(OxygenApp.dob, userModel.data!.dob!.toString());
    await OxygenApp.sharedPreferences!.setBool(OxygenApp.isLoggedIn, true);

    await OxygenApp.sharedPreferences!
        .setString(OxygenApp.userToken, userModel.data!.token!);
  }
}
