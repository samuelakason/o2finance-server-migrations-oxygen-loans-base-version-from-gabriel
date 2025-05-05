import 'dart:io';

import 'package:http/http.dart';
import 'package:oxygen_loans/config/oxygen.dart';

class AppHttpClient {
  static Client getHttpClient() {
    Client client = new Client();
    return client;
  }

  static String getCurentToken() {
    String token =
        OxygenApp.sharedPreferences!.getString(OxygenApp.userToken).toString();
    return token;
  }
}
