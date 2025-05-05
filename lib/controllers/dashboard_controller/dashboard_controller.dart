import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:oxygen_loans/config/http_client.dart';
import 'package:oxygen_loans/config/oxygen.dart';
import 'package:oxygen_loans/controllers/loan/loan.dart';
import 'package:oxygen_loans/models/loan/home.dart';
import 'package:oxygen_loans/repositories/loan.dart';
import 'package:oxygen_loans/services/app_exceptions.dart';
import 'package:oxygen_loans/shared_widgets/alert_messages.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class DashboardController extends GetxController {
  var unViewed = false.obs;
  var loanBalance = "".obs;
  String wallet = "0";
  String loan = "0";
  String userID =
      OxygenApp.sharedPreferences!.getString(OxygenApp.userUID).toString();
  LoanRepository loanRepository = LoanRepository(
    userToken: AppHttpClient.getCurentToken(),
    client: AppHttpClient.getHttpClient(),
  );
  bool loadingHome = true;
  late HomeModel homeModel;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    // listenToWalletChanges();
    // getDetails();
    final ctrl = Get.put(LoanUserController());
    getHome();
  }

  getHome() async {
    try {
      homeModel = await loanRepository.getHome();
      wallet = homeModel.data!.balance!;
      loan = homeModel.data!.loan!;
      loadingHome = false;
      update();
    } catch (e) {
      debugPrint(e.toString());
      loadingHome = false;
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

  RefreshController refreshController =
      RefreshController(initialRefresh: false);

  Future<void> refreshDashboard() async {
    await getHome();

    //AlertMessages().succesMessage("Successful", "Refresded successfully");
    refreshController.refreshCompleted();
  }

  // void listenToWalletChanges() {
  //   print("listennnnn");
  //   OxygenApp.firestore
  //       .collection('users')
  //       .doc(userID)
  //       .snapshots()
  //       .listen((DocumentSnapshot snapshot) async {
  //     wallet = double.parse(snapshot['loan'].toString());
  //     update();
  //     print(wallet.toString() + 'wallet.....');
  //   });
  // }

  // getDetails() async {
  //   String? userID = OxygenApp.sharedPreferences!.getString(OxygenApp.userUID);

  //   var userDetails =
  //       await OxygenApp.firestore.collection('users').doc(userID).get();

  //   int innerLoan = userDetails["loan"].round();
  //   loanBalance.value = innerLoan.toString();
  //   unViewed.value = userDetails["unViewed"];
  //   print(loanBalance.value);
  //   print(unViewed);
  //   update();
  // }
}
