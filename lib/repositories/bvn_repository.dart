import 'dart:convert';

import 'package:oxygen_loans/config/oxygen.dart';
import 'package:oxygen_loans/models/bvn_model.dart';
import 'package:oxygen_loans/services/api_services.dart';
import 'package:http/http.dart' as http;

class BvnRepository {
  final String baseUrl = OxygenApp.baseUrl;
  final String userToken;
  final http.Client client;

  BvnRepository({required this.userToken, required this.client});
  Future<BvnModel?> checkBvn(String bvn, account_number, bank_code, first_name,
      last_name, secretKey) async {
    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      "Authorization": "Bearer $secretKey",
    };
    Map<String, String> payload = {
      "bvn": bvn,
      "account_number": account_number,
      "bank_code": bank_code,
      "first_name": first_name,
      "last_name": last_name,
      "middle_name": ""
    };
    var response = await ApiService()
        .post('https://api.paystack.co/bvn/match', payload, headers, client);
    return bvnModelFromJson(response.body);
  }
}
