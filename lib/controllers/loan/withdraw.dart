import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:oxygen_loans/config/http_client.dart';
import 'package:oxygen_loans/controllers/dashboard_controller/dashboard_controller.dart';
import 'package:oxygen_loans/models/loan/bank_list.dart';
import 'package:oxygen_loans/repositories/loan.dart';
import 'package:oxygen_loans/services/app_exceptions.dart';
import 'package:oxygen_loans/services/global_context.dart';
import 'package:oxygen_loans/shared_widgets/alert_messages.dart';
import 'package:oxygen_loans/shared_widgets/loader.dart';

class WithdrawController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getBankList();
  }

  LoanRepository loanRepository = LoanRepository(
    userToken: AppHttpClient.getCurentToken(),
    client: AppHttpClient.getHttpClient(),
  );
  TextEditingController amountCtrl = TextEditingController();
  TextEditingController searchCtrl = TextEditingController();
  List<AppBankList> bankList = [];
  List<AppBankList> seaerchedBankList = [];
  TextEditingController acctNo = TextEditingController();
  String acctName = '';
  String bankName = '';
  bool loadingBankList = false;
  String resolvedAccountName = 'John Doe';
  int currentBankIndex = 0;
  String currentBankCode = "";
  String currentBankName = "Select Bank";
  getBankList() async {
    try {
      var response = await loanRepository.getBankList();
      bankList = response.data;

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

  resolveAccount() async {
    Loadericons().preloader(GlobalContextService.navigatorKey.currentContext!);
    try {
      var response = await loanRepository.resolveAccount(
          currentBankCode, acctNo.text.trim());
      resolvedAccountName = response.data!.accountName!;
      Navigator.pop(GlobalContextService.navigatorKey.currentContext!);
      update();
    } catch (e) {
      debugPrint(e.toString());
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

  withdrawFunds() async {
    Loadericons().preloader(GlobalContextService.navigatorKey.currentContext!);
    try {
      var response = await loanRepository.withdrawFunds(amountCtrl.text.trim());
      Navigator.pop(GlobalContextService.navigatorKey.currentContext!);
      Navigator.pop(GlobalContextService.navigatorKey.currentContext!);
      AlertMessages().succesMessage("Successful", response.message!);
      final ctrl = Get.find<DashboardController>();
      ctrl.getHome();
      update();
    } catch (e) {
      debugPrint(e.toString());
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

  // savePayOutDetails() async {
  //   Loadericons().preloader(GlobalContextService.navigatorKey.currentContext!);
  //   try {
  //     final response = await WalletRepository().savePayOutDetails(
  //         currentBankName, acctNo.text.trim(), resolvedName, currentBankCode);
  //     resolvedName = response.data.accountName;
  //     Navigator.pop(GlobalContextService.navigatorKey.currentContext!);
  //     AlertMessages()
  //         .succesMessage("Successful", "Acctount details have been updated");
  //   } catch (e) {
  //     Navigator.pop(GlobalContextService.navigatorKey.currentContext!);
  //     if (e == FetchDataException) {
  //       AlertMessages().erroMessage("Network Error!",
  //           "Please check your internet connection. A network error has occurred");
  //     } else {
  //       var responsError = jsonDecode(e.toString());
  //       print(responsError);

  //       AlertMessages().erroMessage("Error!", responsError['message']);
  //     }
  //   }
  // }

  searchBanks() {
    seaerchedBankList = [];
    for (int i = 0; i < bankList.length; i++) {
      if (bankList[i]
          .name!
          .toUpperCase()
          .contains(searchCtrl.text.trim().toUpperCase())) {
        seaerchedBankList.add(bankList[i]);
      }
    }
    print(seaerchedBankList);
  }
}
