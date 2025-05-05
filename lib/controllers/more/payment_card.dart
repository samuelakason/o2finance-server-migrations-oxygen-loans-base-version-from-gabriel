import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_paystack/flutter_paystack.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:oxygen_loans/config/http_client.dart';
import 'package:oxygen_loans/config/oxygen.dart';
import 'package:oxygen_loans/models/wallet/init_save_card.dart';
import 'package:oxygen_loans/models/wallet/saved_cards.dart';
import 'package:oxygen_loans/repositories/wallet.dart';
import 'package:oxygen_loans/services/app_exceptions.dart';
import 'package:oxygen_loans/services/global_context.dart';
import 'package:oxygen_loans/shared_widgets/alert_messages.dart';
import 'package:oxygen_loans/shared_widgets/loader.dart';

class PaymentCardController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getSavedCards();
  }

  WalletRepository walletRepository = WalletRepository(
    userToken: AppHttpClient.getCurentToken(),
    client: AppHttpClient.getHttpClient(),
  );
  final plugin = PaystackPlugin();
  late InitSaveCardModel initSaveCardModel;
  late SavedCardModel savedCardModel;
  bool loadingSavedCards = true;
  getSavedCards() async {
    loadingSavedCards = true;
    update();
    try {
      savedCardModel = await walletRepository.savedCards();
      loadingSavedCards = false;

      update();
    } catch (e) {
      loadingSavedCards = false;
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

  deleteCard(String cardID) async {
    Loadericons().preloader(GlobalContextService.navigatorKey.currentContext!);
    try {
      var response = await walletRepository.deleteCard(cardID);

      Navigator.pop(GlobalContextService.navigatorKey.currentContext!);
      AlertMessages().succesMessage("Successful", response.message!);
      getSavedCards();
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

  intiCardSave() async {
    Loadericons().preloader(GlobalContextService.navigatorKey.currentContext!);
    try {
      initSaveCardModel = await walletRepository.initSaveCard();

      Navigator.pop(GlobalContextService.navigatorKey.currentContext!);
      chargeCard();
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

  chargeCard() async {
    String email =
        OxygenApp.sharedPreferences!.getString(OxygenApp.email).toString();

    await plugin.initialize(publicKey: initSaveCardModel.data!.key!);
    Charge charge = Charge()
      ..amount = 5000
      ..reference = initSaveCardModel.data!.ref!
      ..email = email;
    CheckoutResponse response = await plugin.checkout(
      GlobalContextService.navigatorKey.currentContext!,
      method: CheckoutMethod.card,
      charge: charge,
    );
    if (response.status == true) {
      print(initSaveCardModel.data!.ref!);
      print('hey baby girl');
      verifyCardpayment();
      //verifyOnServer(response.reference.toString());
    } else {}
  }

  verifyCardpayment() async {
    Loadericons().preloader(GlobalContextService.navigatorKey.currentContext!);
    try {
      var response =
          await walletRepository.verifyPayment(initSaveCardModel.data!.ref!);
      AlertMessages().succesMessage("Successful", response.message!);
      Navigator.pop(GlobalContextService.navigatorKey.currentContext!);
      getSavedCards();
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
}
