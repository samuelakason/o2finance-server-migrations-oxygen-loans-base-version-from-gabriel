import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:oxygen_loans/config/oxygen.dart';
import 'package:oxygen_loans/models/auth/message_model.dart';
import 'package:oxygen_loans/models/real_estate/real_esatedetail.dart';
import 'package:oxygen_loans/models/real_estate/real_estate.dart';
import 'package:oxygen_loans/services/api_services.dart';

class RealEstateRepository {
  final String baseUrl = OxygenApp.baseUrl;
  final String userToken;
  final http.Client client;

  RealEstateRepository({required this.userToken, required this.client});

  Future<RealEstateModel> getRealEstate() async {
    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      'Authorization': 'Bearer $userToken',
    };

    var response = await ApiService()
        .get('${baseUrl}api/v1/user/properties', headers, client);
    return RealEstateModel.fromJson(json.decode(response.body));
  }

  Future<RealEstateDetailModel> getRealEstateDetail(String id) async {
    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      'Authorization': 'Bearer $userToken',
    };

    var response = await ApiService()
        .get('${baseUrl}api/v1/user/properties/$id/details', headers, client);
    return RealEstateDetailModel.fromJson(json.decode(response.body));
  }

  Future<MessageModel> interested(String id) async {
    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      'Authorization': 'Bearer $userToken',
    };
    Map<String, String> payload = {};
    var response = await ApiService().post(
        '${baseUrl}api/v1/user/properties/$id/interested',
        payload,
        headers,
        client);
    return MessageModel.fromJson(json.decode(response.body));
  }
}
