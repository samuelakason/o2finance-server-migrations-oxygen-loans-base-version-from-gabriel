import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class PushNotificationService {
  Future<Map> sendPushNotification(String fcmToken, pushTitle, pushBody) async {
    try {
      Map<String, String> headers = {
        "Content-Type": "application/json",
        "Accept": "application/json",
        "Authorization":
            "key=AAAAa4wQ63Y:APA91bHgHm2KVjy7nPzmnSxkWW3Cf194ELJOaa5Z9XTCxaGDgxJFDvbwC53iK2XCGC7Oce3XWw0XGJeGiJkEyThFnaWv5O03D1PF7reFzvsxS20m6wCjXWizVFr017UL6E_YlS3SLms9",
      };
      String body = jsonEncode({
        "to": fcmToken,
        "collapse_key": "New Message",
        "priority": "high",
        "notification": {
          "title": pushTitle,
          "body": pushBody,
        },
        "data": {
          "url":
              "https://firebasestorage.googleapis.com/v0/b/o2loans-57759.appspot.com/o/oxygenIcon.png?alt=media&token=ab28db2c-7a38-4131-864f-1c07c298e0c2",
        }
      });
      print(".................start");
      http.Response response = await http.post(
          Uri.parse('https://fcm.googleapis.com/fcm/send'),
          headers: headers,
          body: body);
      print(response.body);
      var status = json.decode(response.body);

      return status;
    } on SocketException catch (e) {
      print("socket.........");
    }
    throw Exception('BarException');
  }
}
