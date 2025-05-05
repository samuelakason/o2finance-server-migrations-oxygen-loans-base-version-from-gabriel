import 'dart:async';

import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:oxygen_loans/config/oxygen.dart';
import 'package:oxygen_loans/screens/auth/create_pin.dart';

class VerifyEmailController extends GetxController {
  Timer? timer;
  var email = OxygenApp.sharedPreferences!.getString(OxygenApp.email);

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    timer = Timer.periodic(Duration(milliseconds: 500), (timer) {
      checkEmailVerified();
    });
  }

  @override
  void onClose() {
    timer!.cancel();
  }

  Future<void> checkEmailVerified() async {
    // OxygenApp.user = OxygenApp.auth!.currentUser;
    // await OxygenApp.user!.reload();
    // if (OxygenApp.user!.emailVerified == true) {
    //   timer!.cancel();
    //   print("verified");
    //   Get.off(() => CreatePin(),
    //       duration: const Duration(seconds: 2),
    //       transition: Transition.circularReveal);
    // }
  }
}
