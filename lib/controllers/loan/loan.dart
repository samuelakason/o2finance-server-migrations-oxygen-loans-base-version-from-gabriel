import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:oxygen_loans/config/http_client.dart';
import 'package:oxygen_loans/config/oxygen.dart';
import 'package:oxygen_loans/models/loan/bank_list.dart';
import 'package:oxygen_loans/models/loan/get_guarantors.dart';
import 'package:oxygen_loans/models/loan/initialize.dart';
import 'package:oxygen_loans/models/loan/loan_history.dart';
import 'package:oxygen_loans/repositories/loan.dart';
import 'package:oxygen_loans/screens/auth/login.dart';
import 'package:oxygen_loans/screens/loans/create_guarantors.dart';
import 'package:oxygen_loans/screens/loans/select_plan.dart';
import 'package:oxygen_loans/screens/loans/verify_bvn.dart';
import 'package:oxygen_loans/screens/loans/widgets/bank_list_sheet.dart';
import 'package:oxygen_loans/screens/loans/widgets/loan_success.dart';
import 'package:oxygen_loans/services/app_exceptions.dart';
import 'package:oxygen_loans/services/global_context.dart';
import 'package:oxygen_loans/shared_widgets/alert_messages.dart';
import 'package:oxygen_loans/shared_widgets/app_bottom_sheet.dart';
import 'package:oxygen_loans/shared_widgets/loader.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:sizer/sizer.dart';

class LoanUserController extends GetxController {
  TextEditingController gNameCtrl = TextEditingController();
  TextEditingController gemailCtrl = TextEditingController();
  TextEditingController gphoneCtrl = TextEditingController();
  TextEditingController goccupationCtrl = TextEditingController();
  TextEditingController gaddressCtrl = TextEditingController();
  TextEditingController amountCtrl = TextEditingController();
  TextEditingController purposeCtrl = TextEditingController();
  TextEditingController bankAccountCtrl = TextEditingController();
  TextEditingController searchCtrl = TextEditingController();
  int currentBankIndex = 0;
  bool guarantorError = false;
  String bankCode = '';
  String resolvedAccountName = '';
  String currentBankName = 'Bank Name';
  bool verified = false;
  bool hasPendingLoan = false;
  bool hasActiveLoan = false;
  String selectedPlanID = '';
  bool hasGuarantors =
      OxygenApp.sharedPreferences!.getBool(OxygenApp.hasGuarantors) ?? false;
  List<GuarantorDatum> gurantors = [];
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    intiLoan();
    getBankList();
    getLoanHistory(false);
    getLoanGuarantors(true);
  }

  late LoanDatum selectedLoan;
  List<AppBankList> bankList = [];
  List<AppBankList> seaerchedBankList = [];

  LoanRepository loanRepository = LoanRepository(
    userToken: AppHttpClient.getCurentToken(),
    client: AppHttpClient.getHttpClient(),
  );
  late InitialiseLoanModel initialiseLoanModel;
  late LoanHistorytModel loanHistorytModel;
  bool loadingLoanHistory = true;
  getLoanHistory(bool silent) async {
    if (!silent) {
      loadingLoanHistory = true;
      update();
    }

    try {
      loanHistorytModel = await loanRepository.getLoanHistory();
      loadingLoanHistory = false;
      update();
    } catch (e) {
      debugPrint(e.toString());
      loadingLoanHistory = false;
      update();
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

  getLoanGuarantors(bool isSilent) async {
    guarantorError = false;
    if (!isSilent) {
      Loadericons()
          .preloader(GlobalContextService.navigatorKey.currentContext!);
    }

    try {
      final response = await loanRepository.getGuarantors();
      gurantors = response.data;
      if (gurantors.isNotEmpty) {
        OxygenApp.sharedPreferences!.setBool(OxygenApp.hasGuarantors, true);
        hasGuarantors = true;
      } else {
        OxygenApp.sharedPreferences!.setBool(OxygenApp.hasGuarantors, false);
        hasGuarantors = false;
      }
      update();
      if (!isSilent) {
        Navigator.pop(GlobalContextService.navigatorKey.currentContext!);
        if (gurantors.isNotEmpty) {
          if (verified) {
            Get.to(() => SelectPlan(),
                duration: const Duration(milliseconds: 1000),
                transition: Transition.rightToLeft);
          } else {
            Get.to(() => VerifyBvn(),
                duration: const Duration(milliseconds: 1000),
                transition: Transition.rightToLeft);
          }
        } else {
          Get.to(() => CreateGuarantors(),
              duration: const Duration(milliseconds: 1000),
              transition: Transition.rightToLeft);
        }
      }
    } catch (e) {
      guarantorError = true;
      debugPrint(e.toString());
      if (!isSilent) {
        Navigator.pop(GlobalContextService.navigatorKey.currentContext!);
      }
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

  createGuarantor() async {
    Loadericons().preloader(GlobalContextService.navigatorKey.currentContext!);
    try {
      var response = await loanRepository.saveGuarantors(
        gNameCtrl.text.trim(),
        gemailCtrl.text.trim(),
        gphoneCtrl.text.trim(),
        goccupationCtrl.text.trim(),
        gaddressCtrl.text.trim(),
      );

      Navigator.pop(GlobalContextService.navigatorKey.currentContext!);
      getLoanGuarantors(true);
      Get.to(() => VerifyBvn(),
          duration: const Duration(milliseconds: 1000),
          transition: Transition.rightToLeft);
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

  intiLoan() async {
    try {
      var response = await loanRepository.initializeLoan();
      initialiseLoanModel = response;
      verified = initialiseLoanModel.data!.verified!;
      hasPendingLoan = initialiseLoanModel.data!.hasPendingLoan!;

      hasActiveLoan = initialiseLoanModel.data!.hasActiveLoan!;
      debugPrint(initialiseLoanModel.data!.hasActiveLoan.toString());
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
          bankCode, bankAccountCtrl.text.trim());
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

  verifyBvn() async {
    Loadericons().preloader(GlobalContextService.navigatorKey.currentContext!);
    try {
      debugPrint(bankCode + '....from app');
      debugPrint(bankAccountCtrl.text.trim() + '....from app');
      var response =
          await loanRepository.verifyBvn(bankCode, bankAccountCtrl.text.trim());

      Navigator.pop(GlobalContextService.navigatorKey.currentContext!);
      Get.to(() => SelectPlan(),
          duration: const Duration(milliseconds: 1000),
          transition: Transition.rightToLeft);
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

  requestLoan() async {
    Loadericons().preloader(GlobalContextService.navigatorKey.currentContext!);
    try {
      var response = await loanRepository.requestLoan(
          selectedPlanID, amountCtrl.text.trim(), purposeCtrl.text.trim());

      Navigator.pop(GlobalContextService.navigatorKey.currentContext!);
      AppBottomSheet().bottomSheet(LoanSuccess(), 50.h);
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

  RefreshController refreshController =
      RefreshController(initialRefresh: false);

  Future<void> refreshDashboard() async {
    await getLoanHistory(true);

    //AlertMessages().succesMessage("Successful", "Refresded successfully");
    refreshController.refreshCompleted();
  }

  String formatDate(DateTime date) {
    String day = DateFormat('d').format(date);
    String suffix = getDaySuffix(int.parse(day));
    String month = DateFormat('MMMM').format(date);
    return '$day$suffix, $month';
  }

  String getDaySuffix(int day) {
    if (day >= 11 && day <= 13) {
      return 'th';
    }
    switch (day % 10) {
      case 1:
        return 'st';
      case 2:
        return 'nd';
      case 3:
        return 'rd';
      default:
        return 'th';
    }
  }
}
