import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_paystack/flutter_paystack.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:oxygen_loans/config/http_client.dart';
import 'package:oxygen_loans/config/oxygen.dart';
import 'package:oxygen_loans/controllers/loan/loan.dart';
import 'package:oxygen_loans/models/loan/dedicated_account.dart';
import 'package:oxygen_loans/models/loan/get_bank_details.dart';
import 'package:oxygen_loans/models/loan/loan_history.dart';
import 'package:oxygen_loans/models/loan/loan_payment_method.dart';
import 'package:oxygen_loans/models/wallet/init_save_card.dart';
import 'package:oxygen_loans/repositories/loan.dart';
import 'package:oxygen_loans/repositories/wallet.dart';
import 'package:oxygen_loans/screens/loans/widgets/account_details.dart';
import 'package:oxygen_loans/screens/loans/widgets/loan_repayment_method.dart';
import 'package:oxygen_loans/services/app_exceptions.dart';
import 'package:oxygen_loans/services/global_context.dart';
import 'package:oxygen_loans/shared_widgets/alert_messages.dart';
import 'package:oxygen_loans/shared_widgets/app_bottom_sheet.dart';
import 'package:oxygen_loans/shared_widgets/loader.dart';
import 'package:sizer/sizer.dart';

class LoanRepaymentController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  late LoanDatum selectedLoan;
  final plugin = PaystackPlugin();
  WalletRepository walletRepository = WalletRepository(
    userToken: AppHttpClient.getCurentToken(),
    client: AppHttpClient.getHttpClient(),
  );
  late VirtualAccountModel virtualAccountModel;

  late InitSaveCardModel initSaveCardModel;
  LoanRepository loanRepository = LoanRepository(
    userToken: AppHttpClient.getCurentToken(),
    client: AppHttpClient.getHttpClient(),
  );
  late DedicatedAccountModel dedicatedAccountModel;
  late LoanPaymentModel loanPaymentModel;
  String loanID = "";
  getPaymentMethods(String loanID) async {
    Loadericons().preloader(GlobalContextService.navigatorKey.currentContext!);
    try {
      loanPaymentModel = await loanRepository.loanPaymentMethod(loanID);

      debugPrint(loanPaymentModel.data.first);
      Navigator.pop(GlobalContextService.navigatorKey.currentContext!);
      AppBottomSheet().bottomSheet(LoanRepaymentMethodSheet(), 40.h);
      update();
    } catch (e) {
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

  getBankDetails(String loanID) async {
    Loadericons().preloader(GlobalContextService.navigatorKey.currentContext!);
    try {
      var response = await loanRepository.getBankDetails(loanID);
      virtualAccountModel = response;

      Navigator.pop(GlobalContextService.navigatorKey.currentContext!);
      AppBottomSheet().bottomSheet(AccountDetails(), 40.h);
      update();
    } catch (e) {
      Navigator.pop(GlobalContextService.navigatorKey.currentContext!);
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

  payWithSavedCard(String cardID) async {
    Loadericons().preloader(GlobalContextService.navigatorKey.currentContext!);

    try {
      var response = await loanRepository.payWithSavedCards(
          selectedLoan.loanId.toString(), cardID);
      Navigator.pop(GlobalContextService.navigatorKey.currentContext!);
      AlertMessages().succesMessage("Successful", response.message!);
      final ctrl = Get.find<LoanUserController>();
      ctrl.getLoanHistory(true);

      update();
    } catch (e) {
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

  getDVA(String loanID) async {
    Loadericons().preloader(GlobalContextService.navigatorKey.currentContext!);
    try {
      dedicatedAccountModel = await loanRepository.getDVA();

      debugPrint(loanPaymentModel.data.first);
      Navigator.pop(GlobalContextService.navigatorKey.currentContext!);
      AppBottomSheet().bottomSheet(LoanRepaymentMethodSheet(), 30.h);
      update();
    } catch (e) {
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
