import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:oxygen_loans/config/oxygen.dart';
import 'package:oxygen_loans/models/auth/message_model.dart';
import 'package:oxygen_loans/models/auth/register.dart';
import 'package:oxygen_loans/models/auth/user.dart';
import 'package:oxygen_loans/models/bills/airtime_providers.dart';
import 'package:oxygen_loans/models/bills/buy_electricity.dart';
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
import 'package:oxygen_loans/services/api_services.dart';

class BillRepository {
  final String baseUrl = OxygenApp.baseUrl;
  final String userToken;
  final http.Client client;

  BillRepository({required this.userToken, required this.client});

  Future<AirtimeProvidersModel> getAirtimeProviders() async {
    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      'Authorization': 'Bearer $userToken',
    };

    var response = await ApiService()
        .get('${baseUrl}api/v1/user/bills/airtime/providers', headers, client);
    return AirtimeProvidersModel.fromJson(json.decode(response.body));
  }

  Future<MessageModel> buyAirtime(String amount, phone, providerID) async {
    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      'Authorization': 'Bearer $userToken',
    };
    Map<String, String> payload = {"amount": amount, "phoneNumber": phone};
    var response = await ApiService().post(
        '${baseUrl}api/v1/user/bills/airtime/$providerID/buy',
        payload,
        headers,
        client);
    return MessageModel.fromJson(json.decode(response.body));
  }

  Future<AirtimeProvidersModel> getDataProviders() async {
    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      'Authorization': 'Bearer $userToken',
    };

    var response = await ApiService()
        .get('${baseUrl}api/v1/user/bills/data/providers', headers, client);
    return AirtimeProvidersModel.fromJson(json.decode(response.body));
  }

  Future<DataVariatiosModel> getDataVariations(String providerID) async {
    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      'Authorization': 'Bearer $userToken',
    };

    var response = await ApiService().get(
        '${baseUrl}api/v1/user/bills/data/$providerID/variations',
        headers,
        client);
    return DataVariatiosModel.fromJson(json.decode(response.body));
  }

  Future<MessageModel> buyData(String providerID, variationCode, phone) async {
    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      'Authorization': 'Bearer $userToken',
    };
    Map<String, String> payload = {"recipientAccount": phone};
    var response = await ApiService().post(
        '${baseUrl}api/v1/user/bills/data/$providerID/buy/$variationCode',
        payload,
        headers,
        client);
    return MessageModel.fromJson(json.decode(response.body));
  }

  Future<ElectrictyProviderModel> getElectrictyProviders() async {
    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      'Authorization': 'Bearer $userToken',
    };

    var response = await ApiService().get(
        '${baseUrl}api/v1/user/bills/electricity/providers', headers, client);
    return ElectrictyProviderModel.fromJson(json.decode(response.body));
  }

  Future<ElectrictyVerificationModel> electrictyVerification(
      String providerID, meterType, meterNumber) async {
    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      'Authorization': 'Bearer $userToken',
    };
    Map<String, String> payload = {
      "meterType": meterType,
      "meterNumber": meterNumber
    };
    var response = await ApiService().post(
        '${baseUrl}api/v1/user/bills/electricity/$providerID/meter-details',
        payload,
        headers,
        client);
    return ElectrictyVerificationModel.fromJson(json.decode(response.body));
  }

  Future<BuyElectrictyModel> buyEelectricty(
      String providerID, meterType, meterNumber, amount) async {
    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      'Authorization': 'Bearer $userToken',
    };
    Map<String, String> payload = {
      "amount": amount,
      "meterType": meterType,
      "meterNumber": meterNumber
    };
    var response = await ApiService().post(
        '${baseUrl}api/v1/user/bills/electricity/$providerID/buy',
        payload,
        headers,
        client);
    return BuyElectrictyModel.fromJson(json.decode(response.body));
  }

  Future<CableProvidersModel> getCableProviders() async {
    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      'Authorization': 'Bearer $userToken',
    };

    var response = await ApiService()
        .get('${baseUrl}api/v1/user/bills/cable/providers', headers, client);
    return CableProvidersModel.fromJson(json.decode(response.body));
  }

  Future<CableVariationsModel> getCableVariations(String providerID) async {
    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      'Authorization': 'Bearer $userToken',
    };

    var response = await ApiService().get(
        '${baseUrl}api/v1/user/bills/cable/$providerID/variations',
        headers,
        client);
    return CableVariationsModel.fromJson(json.decode(response.body));
  }

  Future<CableSmartcardVerificatioModel> cableSmartCardVerification(
      String smartcardNumber) async {
    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      'Authorization': 'Bearer $userToken',
    };
    Map<String, String> payload = {
      "smartcardNumber": smartcardNumber,
    };
    var response = await ApiService().post(
        '${baseUrl}api/v1/user/bills/cable/{provider_id}/card-details',
        payload,
        headers,
        client);
    return CableSmartcardVerificatioModel.fromJson(json.decode(response.body));
  }

  Future<MessageModel> buyCable(
      String smartcardNumber, providerID, variationCode) async {
    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      'Authorization': 'Bearer $userToken',
    };
    Map<String, String> payload = {
      "smartcardNumber": smartcardNumber,
    };
    var response = await ApiService().post(
        '${baseUrl}api/v1/user/bills/cable/$providerID/buy/$variationCode',
        payload,
        headers,
        client);
    return MessageModel.fromJson(json.decode(response.body));
  }
}
