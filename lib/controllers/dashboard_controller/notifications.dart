import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:oxygen_loans/config/http_client.dart';
import 'package:oxygen_loans/models/loan/app_notification.dart';
import 'package:oxygen_loans/models/loan/treansaction_history.dart';
import 'package:oxygen_loans/repositories/loan.dart';
import 'package:oxygen_loans/services/app_exceptions.dart';
import 'package:oxygen_loans/shared_widgets/alert_messages.dart';

class AppNotificiationController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getNotifications();
  }

  bool loadingNotofications = true;
  LoanRepository loanRepository = LoanRepository(
    userToken: AppHttpClient.getCurentToken(),
    client: AppHttpClient.getHttpClient(),
  );
  late NotificationModeHistory notificationModeHistory;
  getNotifications() async {
    loadingNotofications = true;
    update();
    try {
      notificationModeHistory = await loanRepository.getNotifications();
      loadingNotofications = false;
      update();
      debugPrint(notificationModeHistory.data.length.toString() + '....notice');
    } catch (e) {
      loadingNotofications = false;
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
