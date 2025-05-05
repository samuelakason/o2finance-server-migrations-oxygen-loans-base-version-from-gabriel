import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:intl/intl.dart';
import 'package:oxygen_loans/bottom_nav_layout.dart';
import 'package:oxygen_loans/config/http_client.dart';
import 'package:oxygen_loans/config/oxygen.dart';
import 'package:oxygen_loans/models/auth/user.dart';
import 'package:oxygen_loans/repositories/aurh.dart';
import 'package:oxygen_loans/screens/auth/create_password.dart';
import 'package:oxygen_loans/screens/auth/register2.dart';
import 'package:oxygen_loans/screens/auth/verify_eamil.dart';
import 'package:oxygen_loans/screens/widgets/loaders.dart';
import 'package:oxygen_loans/services/app_exceptions.dart';
import 'package:oxygen_loans/services/global_context.dart';
import 'package:oxygen_loans/shared_widgets/loader.dart';
import 'package:oxygen_loans/utils/alert_messages.dart';
import 'package:sizer/sizer.dart';

class SignUpController extends GetxController {
  final GlobalKey<FormState> signupFormKey1 = GlobalKey<FormState>();
  final GlobalKey<FormState> createPasswordFormKey = GlobalKey<FormState>();
  TextEditingController codeCtrl = TextEditingController();
  final codeFormKey = GlobalKey<FormState>();
  var password = '';
  var confirmPassword = '';
  String userID = '';
  int globalFirst = 0;
  bool isObscure = true;
  Timer? timer;
  int start = 60;
  TextEditingController firstNameTextEditingController =
      TextEditingController();
  TextEditingController lastnameTextEditingController = TextEditingController();
  TextEditingController userNameTextEditingController = TextEditingController();
  TextEditingController refTextEditingController = TextEditingController();
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController phoneTextEditingController = TextEditingController();
  TextEditingController bvnController = TextEditingController();
  TextEditingController cPasswordController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  AuthRepository authRepository = AuthRepository(
    userToken: AppHttpClient.getCurentToken(),
    client: AppHttpClient.getHttpClient(),
  );
  var firstname = '';
  var lastname = '';
  var username = '';
  var referral = '';
  var email = '';
  var phone = '';
  var dob = '';
  var bvnNo = '';
  String referralID = '';
  var selectedDate = DateTime.now();
  var displayDate = "Select date of birth".obs;

  String? validateEmail(String value) {
    if (!GetUtils.isEmail(value)) {
      return "Provide valid Email";
    }
    return null;
  }

  String? validateText(String value) {
    if (value.length < 2) {
      return "Please fill this field appropriately";
    }
    return null;
  }

  Future<Null> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime(1950),
        initialDatePickerMode: DatePickerMode.day,
        firstDate: DateTime(1950),
        lastDate: DateTime(2101));
    if (picked != null) {
      var differenceInDays = DateTime.now().difference(picked).inDays;
      double innerAge = int.parse(differenceInDays.toString()) / 365;
      int actualAge = innerAge.round();
      print(actualAge);

      selectedDate = picked;
      final DateFormat formatter = DateFormat('yyyy-MM-dd');
      displayDate.value = formatter.format(selectedDate);
      print(displayDate);
      update();
    }
  }

  registerUser() async {
    Loadericons().preloader(GlobalContextService.navigatorKey.currentContext!);
    try {
      final response = await authRepository.register(
          firstNameTextEditingController.text.trim(),
          lastnameTextEditingController.text.trim(),
          emailTextEditingController.text.trim(),
          phoneTextEditingController.text.trim(),
          displayDate.value,
          bvnController.text.trim(),
          true,
          passwordController.text.trim());
      Navigator.pop(GlobalContextService.navigatorKey.currentContext!);
      userID = response.data!.userId.toString();
      debugPrint(userID.toString() + '..user id');
      startTimer();
      Get.offAll(() => VerifyEmail(),
          duration: const Duration(milliseconds: 1000),
          transition: Transition.rightToLeft);
      update();
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

  verifyEmail() async {
    Loadericons().preloader(GlobalContextService.navigatorKey.currentContext!);
    try {
      final response = await authRepository.verifyUsers(
        codeCtrl.text.trim(),
        "deviceName",
        userID,
      );
      Navigator.pop(GlobalContextService.navigatorKey.currentContext!);
      await saveToPrefs(response);
      Get.offAll(() => MainScreen(sIndex: 0),
          duration: const Duration(milliseconds: 1000),
          transition: Transition.rightToLeft);

      update();
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

  resendOpt() async {
    Loadericons().preloader(GlobalContextService.navigatorKey.currentContext!);
    try {
      final response = await authRepository.resendOtp(
        "signup",
        userID,
      );
      startTimer();
      AlertMessages().succesMessage("Successful", response.message!);
      update();
      Navigator.pop(GlobalContextService.navigatorKey.currentContext!);
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
    await OxygenApp.sharedPreferences!
        .setString(OxygenApp.referrer, refTextEditingController.text.trim());
    await OxygenApp.sharedPreferences!
        .setString(OxygenApp.phoneNumber, userModel.data!.phoneNumber!);
    // await OxygenApp.sharedPreferences!
    //     .setString(OxygenApp.dob, userModel.data!.dob!.toString());
    await OxygenApp.sharedPreferences!.setBool(OxygenApp.isLoggedIn, true);

    await OxygenApp.sharedPreferences!
        .setString(OxygenApp.userToken, userModel.data!.token!);
  }

  navigateToNext(BuildContext context) async {
    final isValid = signupFormKey1.currentState!.validate();
    if (isValid) {
      signupFormKey1.currentState!.save();
      if (displayDate.value != 'Select date of birth') {
        LoadersIcons().preloader(context);

        Navigator.pop(context);
        Get.to(() => CreatePassword(),
            duration: const Duration(seconds: 2),
            transition: Transition.circularReveal);
      }
    } else {
      AlertMessages().erroMessage("Error", "Please select date of birth");
    }
  }

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (start == 0) {
          timer.cancel();
          update();
        } else {
          start--;
          update();
        }
      },
    );
  }
}
