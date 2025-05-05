import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:oxygen_loans/config/http_client.dart';
import 'package:oxygen_loans/models/loan/treansaction_history.dart';
import 'package:oxygen_loans/repositories/loan.dart';
import 'package:oxygen_loans/services/app_exceptions.dart';
import 'package:oxygen_loans/shared_widgets/alert_messages.dart';

class TransactionHistoryController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getTransactionHistory();
  }

  bool loadingTransactionHistory = true;
  LoanRepository loanRepository = LoanRepository(
    userToken: AppHttpClient.getCurentToken(),
    client: AppHttpClient.getHttpClient(),
  );
  late TransactionDatum selcetdTransaction;
  late TransactionHistory transactionHistory;
  getTransactionHistory() async {
    loadingTransactionHistory = true;
    update();
    try {
      transactionHistory = await loanRepository.getTransactionHistory();
      loadingTransactionHistory = false;
      update();
    } catch (e) {
      loadingTransactionHistory = false;
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
