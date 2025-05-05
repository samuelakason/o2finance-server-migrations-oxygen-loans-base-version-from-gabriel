import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:oxygen_loans/config/oxygen.dart';
import 'package:oxygen_loans/models/auth/message_model.dart';
import 'package:oxygen_loans/models/auth/register.dart';
import 'package:oxygen_loans/models/auth/user.dart';
import 'package:oxygen_loans/models/bills/airtime_providers.dart';
import 'package:oxygen_loans/models/bills/cable_providers.dart';
import 'package:oxygen_loans/models/bills/cable_smart_card_verification.dart';
import 'package:oxygen_loans/models/bills/cable_variations.dart';
import 'package:oxygen_loans/models/bills/data_variations.dart';
import 'package:oxygen_loans/models/bills/electricty_providers.dart';
import 'package:oxygen_loans/models/bills/electricty_verification.dart';
import 'package:oxygen_loans/models/loan/bank_list.dart';
import 'package:oxygen_loans/models/loan/home.dart';
import 'package:oxygen_loans/models/loan/initialize.dart';
import 'package:oxygen_loans/models/loan/resolve_account.dart';
import 'package:oxygen_loans/models/wallet/init_save_card.dart';
import 'package:oxygen_loans/models/wallet/saved_cards.dart';
import 'package:oxygen_loans/services/api_services.dart';

class WalletRepository {
  final String baseUrl = OxygenApp.baseUrl;
  final String userToken;
  final http.Client client;

  WalletRepository({required this.userToken, required this.client});

  Future<InitSaveCardModel> initSaveCard() async {
    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      'Authorization': 'Bearer $userToken',
    };

    var response = await ApiService()
        .get('${baseUrl}api/v1/user/more/cards/add', headers, client);
    return InitSaveCardModel.fromJson(json.decode(response.body));
  }

  Future<MessageModel> verifyPayment(String ref) async {
    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      'Authorization': 'Bearer $userToken',
    };

    var response = await ApiService().get(
        '${baseUrl}api/payment-gateways/paystack/verify/$ref', headers, client);
    return MessageModel.fromJson(json.decode(response.body));
  }

  Future<SavedCardModel> savedCards() async {
    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      'Authorization': 'Bearer $userToken',
    };

    var response = await ApiService()
        .get('${baseUrl}api/v1/user/more/cards', headers, client);
    return SavedCardModel.fromJson(json.decode(response.body));
  }

  Future<MessageModel> deleteCard(String cardID) async {
    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      'Authorization': 'Bearer $userToken',
    };
    Map<String, String> payload = {"cardId": cardID};
    var response = await ApiService().delete(
        '${baseUrl}api/v1/user/more/cards/remove', payload, headers, client);
    return MessageModel.fromJson(json.decode(response.body));
  }
}
