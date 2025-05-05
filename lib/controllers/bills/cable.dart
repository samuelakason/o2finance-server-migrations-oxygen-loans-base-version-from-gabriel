import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:oxygen_loans/config/color_config.dart';
import 'package:oxygen_loans/config/http_client.dart';
import 'package:oxygen_loans/config/oxygen.dart';
import 'package:oxygen_loans/controllers/dashboard_controller/dashboard_controller.dart';
import 'package:oxygen_loans/models/bills/cable_providers.dart';
import 'package:oxygen_loans/models/bills/cable_smart_card_verification.dart';
import 'package:oxygen_loans/models/bills/cable_variations.dart';
import 'package:oxygen_loans/models/bills/electricty_providers.dart';
import 'package:oxygen_loans/models/bills/electricty_verification.dart';
import 'package:oxygen_loans/repositories/bills.dart';
import 'package:oxygen_loans/screens/bills/electricity/widgets/confirmation_sheet.dart';
import 'package:oxygen_loans/screens/bills/electricity/widgets/electricity_success.dart';
import 'package:oxygen_loans/screens/bills/electricity/widgets/electricty_confirmation.dart';
import 'package:oxygen_loans/screens/widgets/loaders.dart';
import 'package:oxygen_loans/services/app_exceptions.dart';
import 'package:oxygen_loans/services/global_context.dart';
import 'package:oxygen_loans/shared_widgets/app_bottom_sheet.dart';
import 'package:oxygen_loans/shared_widgets/buttons.dart';
import 'package:oxygen_loans/shared_widgets/loader.dart';
import 'package:oxygen_loans/shared_widgets/success_sheet.dart';
import 'package:oxygen_loans/utils/alert_messages.dart';
import 'package:sizer/sizer.dart';
import 'package:http/http.dart' as http;

class CableController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getProviders();
  }

  bool loadingPlans = true;
  bool loadingProoviderVariations = true;
  bool loadingProoviderVariationsError = false;
  String selectedProvider = '';
  String variationCode = '';
  String planName = '';
  String planCost = '';
  TextEditingController smartCardCtrl = TextEditingController();

  BillRepository billRepository = BillRepository(
    userToken: AppHttpClient.getCurentToken(),
    client: AppHttpClient.getHttpClient(),
  );
  late CableProvidersModel cableProvidersModel;
  late CableVariationsModel cableVariationsModel;
  late CableSmartcardVerificatioModel cableSmartcardVerificatioModel;
  bool loadingProvider = true;
  bool loadingProviderError = false;

  getProviders() async {
    loadingProvider = true;
    loadingProviderError = false;
    update();
    try {
      cableProvidersModel = await billRepository.getCableProviders();
      loadingProviderError = false;
      loadingProvider = false;
      update();
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

  getProviderVariation() async {
    loadingProoviderVariations = true;
    loadingProoviderVariationsError = false;
    update();
    try {
      cableVariationsModel =
          await billRepository.getCableVariations(selectedProvider);
      loadingProoviderVariations = false;
      loadingProoviderVariationsError = false;
      update();
    } catch (e) {
      debugPrint(e.toString());
      loadingProoviderVariations = false;
      loadingProoviderVariationsError = true;
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

  smartCardVerification() async {
    Loadericons().preloader(GlobalContextService.navigatorKey.currentContext!);
    try {
      cableSmartcardVerificatioModel = await billRepository
          .cableSmartCardVerification(smartCardCtrl.text.trim());
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

  buyCable() async {
    Loadericons().preloader(GlobalContextService.navigatorKey.currentContext!);

    try {
      var response = await billRepository.buyCable(
          smartCardCtrl.text.trim(), selectedProvider, variationCode);

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
