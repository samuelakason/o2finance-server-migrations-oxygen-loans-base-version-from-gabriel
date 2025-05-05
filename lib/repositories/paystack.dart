import 'dart:convert';

import 'package:oxygen_loans/config/oxygen.dart';
import 'package:oxygen_loans/models/paystack/auth_charge.dart';
import 'package:oxygen_loans/models/paystack/check_acct.dart';
import 'package:oxygen_loans/models/paystack/make_transfer.dart';
import 'package:oxygen_loans/models/paystack/transfer_recipient.dart';
import 'package:oxygen_loans/models/paystack/verify_auth_payment.dart';
import 'package:oxygen_loans/models/paystack/verify_payment.dart';
import 'package:oxygen_loans/services/api_services.dart';
import 'package:http/http.dart' as http;

class PaystackRepository {
  final String baseUrl = OxygenApp.baseUrl;
  final String userToken;
  final http.Client client;

  PaystackRepository({required this.userToken, required this.client});
  Future<CheckAcctNumberModel?> checkAcct(
      String accNo, bankCode, secretKey) async {
    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      "Authorization": "Bearer $secretKey",
    };

    var response = await ApiService().get(
        'https://api.paystack.co/bank/resolve?account_number=$accNo&bank_code=$bankCode',
        headers,
        client);
    return checkAcctNumberModelFromJson(response.body);
  }

  Future<TransferRecipientModel?> transferRecipient(
      String name, accountNumber, bankCode, secretKey) async {
    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      "Authorization": "Bearer $secretKey",
    };

    Map<String, String> payload = {
      "type": "nuban",
      "name": name,
      "account_number": accountNumber,
      "bank_code": bankCode,
      "currency": "NGN"
    };

    var response = await ApiService().post(
        'https://api.paystack.co/transferrecipient', payload, headers, client);
    return transferRecipientModelFromJson(response.body);
  }

  Future<MakeTransferModel?> makeTransfer(
      String amount, recCode, secretKey) async {
    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      "Authorization": "Bearer $secretKey",
    };

    Map<String, String> payload = {
      "source": "balance",
      "amount": amount,
      "recipient": recCode,
      "reason": "O2 finance"
    };

    var response = await ApiService()
        .post('https://api.paystack.co/transfer', payload, headers, client);
    return makeTransferModelFromJson(response.body);
  }

  Future<AuthorizationChargeModel?> authCharge(
      String authCode, email, amount, reference, secretKey) async {
    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      "Authorization": "Bearer $secretKey",
    };

    Map<String, String> payload = {
      "authorization_code": authCode,
      "email": email,
      "amount": amount,
      "reference": reference
    };

    var response = await ApiService().post(
        'https://api.paystack.co/transaction/charge_authorization',
        payload,
        headers,
        client);
    print(response.body);
    return authorizationChargeModelFromJson(response.body);
  }

  Future<VerifyPaymentModel?> verifyPayment(String ref, secretKey) async {
    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      "Authorization": "Bearer $secretKey",
    };

    var response = await ApiService().get(
        'https://api.paystack.co/transaction/verify/$ref', headers, client);
    return verifyPaymentModelFromJson(response.body);
  }

  Future<VerifyAuthPaymentModel?> verifyAuthPayment(
      String ref, secretKey) async {
    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      "Authorization": "Bearer $secretKey",
    };

    var response = await ApiService().get(
        'https://api.paystack.co/transaction/verify/$ref', headers, client);
    return verifyAuthPaymentModelFromJson(response.body);
  }
}
