import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:oxygen_loans/config/color_config.dart';
import 'package:oxygen_loans/config/http_client.dart';
import 'package:oxygen_loans/models/bills/airtime_providers.dart';
import 'package:oxygen_loans/models/bills/data_variations.dart';
import 'package:oxygen_loans/repositories/bills.dart';
import 'package:oxygen_loans/screens/bills/airtime/widgets/daily_data_plans.dart';
import 'package:oxygen_loans/screens/bills/airtime/widgets/monthly_data_plans.dart';
import 'package:oxygen_loans/screens/bills/airtime/widgets/weekly_data_plans.dart';
import 'package:oxygen_loans/services/app_exceptions.dart';
import 'package:oxygen_loans/services/global_context.dart';
import 'package:oxygen_loans/shared_widgets/alert_messages.dart';
import 'package:oxygen_loans/shared_widgets/app_bottom_sheet.dart';
import 'package:oxygen_loans/shared_widgets/loader.dart';
import 'package:oxygen_loans/shared_widgets/success_sheet.dart';
import 'package:sizer/sizer.dart';

class AirtimeController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getProviders();
  }

  String selectedProvider = '';
  TextEditingController amountCtrl = TextEditingController();
  TextEditingController phoneCtrl = TextEditingController();
  BillRepository billRepository = BillRepository(
    userToken: AppHttpClient.getCurentToken(),
    client: AppHttpClient.getHttpClient(),
  );
  late AirtimeProvidersModel airtimeProvidersModel;

  bool loadingProvider = true;
  bool loadingProviderError = false;
  getProviders() async {
    loadingProvider = true;
    loadingProviderError = false;

    update();
    try {
      airtimeProvidersModel = await billRepository.getAirtimeProviders();
      loadingProvider = false;
      debugPrint(airtimeProvidersModel.message.toString());
      update();
    } catch (e) {
      debugPrint(e.toString());
      loadingProviderError = true;
      loadingProvider = false;
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

  buyAirtime() async {
    Loadericons().preloader(GlobalContextService.navigatorKey.currentContext!);

    try {
      var response = await billRepository.buyAirtime(
          amountCtrl.text.trim(), phoneCtrl.text.trim(), selectedProvider);

      Navigator.pop(GlobalContextService.navigatorKey.currentContext!);
      AppBottomSheet().bottomSheet(
          SuccessSheet(
            text: response.message!,
            callback: () {
              Navigator.pop(GlobalContextService.navigatorKey.currentContext!);
            },
          ),
          40.h);
      update();
    } catch (e) {
      debugPrint(e.toString());
      Navigator.pop(GlobalContextService.navigatorKey.currentContext!);
      // AppBottomSheet().bottomSheet(
      //     SuccessSheet(
      //       text: "Your airtime purchase was successful",
      //       callback: () {
      //         Navigator.pop(GlobalContextService.navigatorKey.currentContext!);
      //       },
      //     ),
      //     40.h);
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
