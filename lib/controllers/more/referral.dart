import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:oxygen_loans/config/http_client.dart';
import 'package:oxygen_loans/config/oxygen.dart';
import 'package:oxygen_loans/models/loan/ferral_history.dart';
import 'package:oxygen_loans/models/loan/referral.dart';
import 'package:oxygen_loans/repositories/loan.dart';
import 'package:oxygen_loans/services/app_exceptions.dart';
import 'package:oxygen_loans/shared_widgets/alert_messages.dart';

class ReferralController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getReferral();
    refCode = OxygenApp.sharedPreferences!.getString(OxygenApp.refCode) ?? "";
  }

  String refCode = '';
  LoanRepository walletRepository = LoanRepository(
    userToken: AppHttpClient.getCurentToken(),
    client: AppHttpClient.getHttpClient(),
  );
  bool loadingReferrals = true;
  late ReferrallModel referrallModel;
  late ReferralHistoryModel referralHistoryModel;
  getReferral() async {
    loadingReferrals = true;
    update();
    try {
      referrallModel = await walletRepository.getReferrals();
      referralHistoryModel = await walletRepository.getReferralHistory();
      loadingReferrals = false;
      OxygenApp.sharedPreferences!
          .setString(OxygenApp.refCode, referrallModel.data!.referralCode!);
      refCode = referrallModel.data!.referralCode!;
      debugPrint(refCode + '.....ref code');
      update();
    } catch (e) {
      loadingReferrals = false;
      update();
      debugPrint(e.toString());

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
