import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:oxygen_loans/config/oxygen.dart';
import 'package:oxygen_loans/models/auth/message_model.dart';
import 'package:oxygen_loans/models/auth/register.dart';
import 'package:oxygen_loans/models/auth/user.dart';
import 'package:oxygen_loans/services/api_services.dart';

class AuthRepository {
  final String baseUrl = OxygenApp.baseUrl;
  final String userToken;
  final http.Client client;

  AuthRepository({required this.userToken, required this.client});

  Future<UserModel> login(String email, password, deviceName) async {
    debugPrint('${baseUrl}api/auth/login');
    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Accept": "application/json",
    };
    Map<String, String> payload = {
      "device_name": deviceName,
      "email": email,
      "password": password
    };
    var response = await ApiService()
        .post('${baseUrl}api/auth/login', payload, headers, client);
    return UserModel.fromJson(json.decode(response.body));
  }

  Future<RegistrerModel> register(
    String firstName,
    lastName,
    email,
    phone,
    dob,
    bvn,
    tc,
    password,
  ) async {
    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Accept": "application/json",
    };
    Map<String, dynamic> payload = {
      "first_name": firstName,
      "last_name": lastName,
      "email_address": email,
      "phone_number": phone,
      "date_of_birth": dob,
      "bank_verification_number": bvn,
      "terms_and_conditions": tc,
      "password": password,
    };
    var response = await ApiService()
        .post('${baseUrl}api/auth/register', payload, headers, client);
    return RegistrerModel.fromJson(json.decode(response.body));
  }

  Future<UserModel> verifyUsers(String otp, deviceName, userID) async {
    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Accept": "application/json",
    };
    Map<String, String> payload = {
      "type": "both",
      "otp": otp,
      "device_name": deviceName
    };
    var response = await ApiService()
        .patch('${baseUrl}api/auth/$userID/verify', payload, headers, client);
    return UserModel.fromJson(json.decode(response.body));
  }

  Future<MessageModel> resendOtp(String otpUse, userID) async {
    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Accept": "application/json",
    };
    Map<String, String> payload = {"otp_use": otpUse};
    var response = await ApiService().post(
        '${baseUrl}api/auth/$userID/resend-otp', payload, headers, client);
    return MessageModel.fromJson(json.decode(response.body));
  }

  Future<MessageModel> passwordReset(String email) async {
    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Accept": "application/json",
    };
    Map<String, String> payload = {"email_or_phone": email};
    var response = await ApiService().post(
        '${baseUrl}api/auth/password/reset-request', payload, headers, client);
    return MessageModel.fromJson(json.decode(response.body));
  }

  Future<MessageModel> createNewPassword(String email, otp, password) async {
    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Accept": "application/json",
    };
    Map<String, String> payload = {
      "email_or_phone": email,
      "otp": otp,
      "password": password,
    };
    var response = await ApiService()
        .patch('${baseUrl}api/auth/password/reset', payload, headers, client);
    return MessageModel.fromJson(json.decode(response.body));
  }

  // Future<UserModel> googleAuthAccess(String token) async {
  //   Map<String, String> headers = {
  //     "Content-Type": "application/json",
  //     "Accept": "application/json",
  //   };
  //   Map<String, String> payload = {
  //     "token": token,
  //   };
  //   var response = await ApiService()
  //       .post('${baseUrl}user/social/google', payload, headers, client);
  //   return userModelFromJson(response.body);
  // }

  // Future<UserModel> appleAuthAccess(String token) async {
  //   Map<String, String> headers = {
  //     "Content-Type": "application/json",
  //     "Accept": "application/json",
  //   };
  //   Map<String, String> payload = {
  //     "token": token,
  //   };
  //   var response = await ApiService()
  //       .post('${baseUrl}user/social/apple', payload, headers, client);
  //   return userModelFromJson(response.body);
  // }

  // Future<UserModel> facebookAuthAccess(String token) async {
  //   Map<String, String> headers = {
  //     "Content-Type": "application/json",
  //     "Accept": "application/json",
  //   };
  //   Map<String, String> payload = {
  //     "token": token,
  //   };
  //   var response = await ApiService()
  //       .post('${baseUrl}user/social/facebook', payload, headers, client);
  //   return userModelFromJson(response.body);
  // }

  // Future<UserModel> join(String defaultLanguage, phone) async {
  //   print('${baseUrl}user/join');
  //   Map<String, String> headers = {
  //     "Content-Type": "application/json",
  //     "Accept": "application/json",
  //   };
  //   Map<String, String> payload = {
  //     "default_language": defaultLanguage,
  //     "phone": phone,
  //   };
  //   var response = await ApiService()
  //       .post('${baseUrl}user/join', payload, headers, client);
  //   return userModelFromJson(response.body);
  // }

  // Future<UserModel> socialUpdatePhone(String defaultLanguage, phone) async {
  //   Map<String, String> headers = {
  //     "Content-Type": "application/json",
  //     "Accept": "application/json",
  //     'Authorization': 'Bearer $userToken',
  //   };
  //   Map<String, String> payload = {
  //     "phone": phone,
  //   };
  //   var response = await ApiService()
  //       .post('${baseUrl}user/phone/update', payload, headers, client);
  //   return userModelFromJson(response.body);
  // }

  // Future<UserModel> socialVerifyPhone(String phone, code) async {
  //   Map<String, String> headers = {
  //     "Content-Type": "application/json",
  //     "Accept": "application/json",
  //     'Authorization': 'Bearer $userToken',
  //   };
  //   Map<String, String> payload = {"phone": phone, "code": code};
  //   var response = await ApiService()
  //       .post('${baseUrl}user/phone/verify', payload, headers, client);
  //   return userModelFromJson(response.body);
  // }

  // Future<MessageModel> socialRegResendOtp(String phone) async {
  //   Map<String, String> headers = {
  //     "Content-Type": "application/json",
  //     "Accept": "application/json",
  //     'Authorization': 'Bearer $userToken',
  //   };
  //   Map<String, String> payload = {
  //     "phone": phone,
  //   };
  //   var response = await ApiService()
  //       .post('${baseUrl}user/phone/resent-otp', payload, headers, client);
  //   return messageModelFromJson(response.body);
  // }

  // Future<MessageModel> normalRegResendOtp(String phone) async {
  //   Map<String, String> headers = {
  //     "Content-Type": "application/json",
  //     "Accept": "application/json",
  //   };
  //   Map<String, String> payload = {
  //     "phone": phone,
  //   };
  //   var response = await ApiService()
  //       .post('${baseUrl}user/resend-otp', payload, headers, client);
  //   return messageModelFromJson(response.body);
  // }

  // Future<UserModel> verifyPhone(String code, phone) async {
  //   Map<String, String> headers = {
  //     "Content-Type": "application/json",
  //     "Accept": "application/json",
  //   };
  //   Map<String, String> payload = {
  //     "phone": phone,
  //     "code": code,
  //   };
  //   var response = await ApiService()
  //       .post('${baseUrl}user/verify', payload, headers, client);
  //   return userModelFromJson(response.body);
  // }

  // Future<MessageModel> requestPasswordOtp(String phone) async {
  //   Map<String, String> headers = {
  //     "Content-Type": "application/json",
  //     "Accept": "application/json",
  //   };
  //   Map<String, String> payload = {
  //     "phone": phone,
  //   };
  //   var response = await ApiService()
  //       .post('${baseUrl}user/forgot-password', payload, headers, client);
  //   return messageModelFromJson(response.body);
  // }

  // Future<MessageModel> resetPassword(
  //     String code, phone, password, passwordConfirmation) async {
  //   Map<String, String> headers = {
  //     "Content-Type": "application/json",
  //     "Accept": "application/json",
  //   };
  //   Map<String, String> payload = {
  //     "phone": phone,
  //     "code": code,
  //     "password": password,
  //     "password_confirmation": passwordConfirmation
  //   };
  //   var response = await ApiService()
  //       .post('${baseUrl}user/reset-password', payload, headers, client);
  //   return messageModelFromJson(response.body);
  // }

  // Future<UserModel> registerUser(String phone, firstName, lastName, gender,
  //     email, password, passwordConfirmation, avatar) async {
  //   Map<String, String> headers = {
  //     "Content-Type": "application/json",
  //     "Accept": "application/json",
  //   };
  //   Map<String, String> payload = {
  //     "phone": phone,
  //     "first_name": firstName,
  //     "last_name": lastName,
  //     "gender": gender.toString().toLowerCase(),
  //     "email": email,
  //     "password": password,
  //     "password_confirmation": passwordConfirmation,
  //     "avatar": avatar,
  //   };
  //   var response = await ApiService()
  //       .post('${baseUrl}user/register', payload, headers, client);
  //   return userModelFromJson(response.body);
  // }

  // Future<MessageModel> updateLocation(String longitude, latitude, city, country,
  //     address, formatteAddress) async {
  //   Map<String, String> headers = {
  //     "Content-Type": "application/json",
  //     "Accept": "application/json",
  //     'Authorization': 'Bearer $userToken',
  //   };
  //   Map<String, String> payload = {
  //     "longitude": longitude,
  //     "latitude": latitude,
  //     "city": city,
  //     "country": country,
  //     "address": address,
  //     "formatted_address": formatteAddress
  //   };
  //   var response = await ApiService().post(
  //       '${baseUrl}user/profile/update-location', payload, headers, client);
  //   return messageModelFromJson(response.body);
  // }

  // Future<AddressModel?> getUserCurrentAddress(
  //     String locationLatitude, locationLongitude) async {
  //   Map<String, String> headers = {
  //     "Content-Type": "application/json",
  //     "Accept": "application/json",
  //   };
  //   var response = await ApiService().get(
  //       'https://maps.googleapis.com/maps/api/geocode/json?latlng=$locationLatitude,$locationLongitude&key=AIzaSyAJZC3ZRvfrDN37hF9n7MKXMSeDMz5m7t4',
  //       headers,
  //       client);
  //   return addressModelFromJson(response.body);
  // }

  // Future<GooglePlaceModel?> getPlacesAutoComplete(
  //     String input, userLat, userLong, sessiontoken) async {
  //   Map<String, String> headers = {
  //     "Content-Type": "application/json",
  //     "Accept": "application/json",
  //   };
  //   var response = await ApiService().get(
  //       'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$input&sessiontoken=$sessiontoken&key=AIzaSyDGyYRbfyiDGZL3EjadmqdWdXTw79QhSDU',
  //       headers,
  //       client);
  //   print('Done fetching');
  //   print(response.body);
  //   return googlePlaceModelFromJson(response.body);
  // }

  // Future<GooglePlaceDetailModel?> getPlaceDetail(
  //     String placeId, sessiontoken) async {
  //   Map<String, String> headers = {
  //     "Content-Type": "application/json",
  //     "Accept": "application/json",
  //   };
  //   var response = await ApiService().get(
  //       'https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&sessiontoken=$sessiontoken&fields=name%2Cgeometry&key=AIzaSyDGyYRbfyiDGZL3EjadmqdWdXTw79QhSDU',
  //       headers,
  //       client);
  //   print('Done fetching');
  //   print(response.body);
  //   return googlePlaceDetailModelFromJson(response.body);
  // }

  // Future<MessageModel> updateFcmToken(String token) async {
  //   Map<String, String> headers = {
  //     "Content-Type": "application/json",
  //     "Accept": "application/json",
  //     'Authorization': 'Bearer $userToken',
  //   };
  //   Map<String, String> payload = {"fcm_token": token};
  //   var response = await ApiService()
  //       .post('${baseUrl}user/profile/update-fcm', payload, headers, client);
  //   return messageModelFromJson(response.body);
  // }
}
