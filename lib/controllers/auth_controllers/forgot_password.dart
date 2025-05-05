import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:oxygen_loans/bottom_nav_layout.dart';
import 'package:oxygen_loans/config/http_client.dart';
import 'package:oxygen_loans/config/oxygen.dart';
import 'package:oxygen_loans/repositories/aurh.dart';
import 'package:oxygen_loans/screens/auth/create_new_password.dart';
import 'package:oxygen_loans/screens/auth/login.dart';
import 'package:oxygen_loans/screens/widgets/loaders.dart';
import 'package:oxygen_loans/services/app_exceptions.dart';
import 'package:oxygen_loans/services/global_context.dart';
import 'package:oxygen_loans/shared_widgets/loader.dart';
import 'package:oxygen_loans/utils/alert_messages.dart';

class ForgotPasswordController extends GetxController {
  String password = "";
  String confirmrPassword = "";
  TextEditingController otpCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();
  TextEditingController confirmpasswordCtrl = TextEditingController();
  bool isObscure = true;
  final TextEditingController emailController = TextEditingController();
  AuthRepository authRepository = AuthRepository(
    userToken: AppHttpClient.getCurentToken(),
    client: AppHttpClient.getHttpClient(),
  );
  sendRequest() async {
    Loadericons().preloader(GlobalContextService.navigatorKey.currentContext!);
    try {
      final response =
          await authRepository.passwordReset(emailController.text.trim());

      AlertMessages().succesMessage("Successful", response.message!);
      update();
      Navigator.pop(GlobalContextService.navigatorKey.currentContext!);
      Get.to(() => CreateNewpassword(),
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

  createNewPassword() async {
    Loadericons().preloader(GlobalContextService.navigatorKey.currentContext!);
    try {
      final response = await authRepository.createNewPassword(
          emailController.text.trim(),
          otpCtrl.text.trim(),
          passwordCtrl.text.trim());

      AlertMessages().succesMessage("Successful", response.message!);

      Navigator.pop(GlobalContextService.navigatorKey.currentContext!);
      Get.offAll(() => Login(),
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
}
