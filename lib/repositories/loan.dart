import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:oxygen_loans/config/oxygen.dart';
import 'package:oxygen_loans/models/auth/message_model.dart';
import 'package:oxygen_loans/models/auth/register.dart';
import 'package:oxygen_loans/models/auth/user.dart';
import 'package:oxygen_loans/models/loan/app_notification.dart';
import 'package:oxygen_loans/models/loan/bank_list.dart';
import 'package:oxygen_loans/models/loan/dedicated_account.dart';
import 'package:oxygen_loans/models/loan/ferral_history.dart';
import 'package:oxygen_loans/models/loan/get_bank_details.dart';
import 'package:oxygen_loans/models/loan/get_guarantors.dart';
import 'package:oxygen_loans/models/loan/home.dart';
import 'package:oxygen_loans/models/loan/initialize.dart';
import 'package:oxygen_loans/models/loan/loan_history.dart';
import 'package:oxygen_loans/models/loan/loan_payment_method.dart';
import 'package:oxygen_loans/models/loan/resolve_account.dart';
import 'package:oxygen_loans/models/loan/referral.dart';
import 'package:oxygen_loans/models/loan/treansaction_history.dart';
import 'package:oxygen_loans/services/api_services.dart';

class LoanRepository {
  final String baseUrl = OxygenApp.baseUrl;
  final String userToken;
  final http.Client client;

  LoanRepository({required this.userToken, required this.client});
  Future<LoanHistorytModel> getLoanHistory() async {
    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      'Authorization': 'Bearer $userToken',
    };

    var response = await ApiService()
        .get('${baseUrl}api/v1/user/loan/history', headers, client);
    return LoanHistorytModel.fromJson(json.decode(response.body));
  }

  Future<HomeModel> getHome() async {
    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      'Authorization': 'Bearer $userToken',
    };

    var response = await ApiService()
        .get('${baseUrl}api/v1/user/home/wallets', headers, client);
    return HomeModel.fromJson(json.decode(response.body));
  }

  Future<InitialiseLoanModel> initializeLoan() async {
    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      'Authorization': 'Bearer $userToken',
    };

    var response = await ApiService()
        .get('${baseUrl}api/v1/user/loan/initialize', headers, client);
    return InitialiseLoanModel.fromJson(json.decode(response.body));
  }

  Future<BankListModel> getBankList() async {
    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      'Authorization': 'Bearer $userToken',
    };

    var response = await ApiService()
        .get('${baseUrl}api/payment-gateways/paystack/banks', headers, client);
    return BankListModel.fromJson(json.decode(response.body));
  }

  Future<ResolveAccountModel> resolveAccount(
      String bankCode, accountNUmber) async {
    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      'Authorization': 'Bearer $userToken',
    };
    Map<String, String> payload = {
      "bankCode": bankCode,
      "accountNumber": accountNUmber
    };
    var response = await ApiService().post(
        '${baseUrl}api/payment-gateways/paystack/bank/account-name',
        payload,
        headers,
        client);
    return ResolveAccountModel.fromJson(json.decode(response.body));
  }

  Future<MessageModel> withdrawFunds(String amount) async {
    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      'Authorization': 'Bearer $userToken',
    };
    Map<String, String> payload = {
      "amount": amount,
    };
    var response = await ApiService().post(
        '${baseUrl}api/v1/user/home/wallets/withdraw',
        payload,
        headers,
        client);
    return MessageModel.fromJson(json.decode(response.body));
  }

  Future<MessageModel> verifyBvn(String bankCode, accountNUmber) async {
    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      'Authorization': 'Bearer $userToken',
    };
    Map<String, String> payload = {
      "bankCode": bankCode,
      "accountNumber": accountNUmber
    };
    var response = await ApiService().post(
        '${baseUrl}api/v1/user/loan/verify-bvn', payload, headers, client);
    return MessageModel.fromJson(json.decode(response.body));
  }

  Future<MessageModel> requestLoan(String planID, amount, purpose) async {
    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      'Authorization': 'Bearer $userToken',
    };
    Map<String, String> payload = {
      "planId": planID,
      "amount": amount,
      "purpose": purpose
    };
    var response = await ApiService()
        .post('${baseUrl}api/v1/user/loan/create', payload, headers, client);
    return MessageModel.fromJson(json.decode(response.body));
  }

  Future<LoanPaymentModel> loanPaymentMethod(String id) async {
    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      'Authorization': 'Bearer $userToken',
    };

    var response = await ApiService()
        .get('${baseUrl}api/v1/user/loan/$id/payment', headers, client);
    return LoanPaymentModel.fromJson(json.decode(response.body));
  }

  Future<MessageModel> payWithSavedCards(String loanId, cardID) async {
    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      'Authorization': 'Bearer $userToken',
    };

    var response = await ApiService().get(
        '${baseUrl}api/v1/user/loan/$loanId/payment/card/$cardID',
        headers,
        client);
    return MessageModel.fromJson(json.decode(response.body));
  }

  Future<DedicatedAccountModel> getDVA() async {
    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      'Authorization': 'Bearer $userToken',
    };

    var response = await ApiService()
        .get('${baseUrl}api/v1/user/more/profile/dva', headers, client);
    return DedicatedAccountModel.fromJson(json.decode(response.body));
  }

  Future<ReferrallModel> getReferrals() async {
    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      'Authorization': 'Bearer $userToken',
    };

    var response = await ApiService()
        .get('${baseUrl}api/v1/user/more/referral/code', headers, client);
    return ReferrallModel.fromJson(json.decode(response.body));
  }

  Future<ReferralHistoryModel> getReferralHistory() async {
    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      'Authorization': 'Bearer $userToken',
    };

    var response = await ApiService()
        .get('${baseUrl}api/v1/user/more/referral/history', headers, client);
    return ReferralHistoryModel.fromJson(json.decode(response.body));
  }

  Future<TransactionHistory> getTransactionHistory() async {
    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      'Authorization': 'Bearer $userToken',
    };

    var response = await ApiService()
        .get('${baseUrl}api/v1/user/more/transactions', headers, client);
    return TransactionHistory.fromJson(json.decode(response.body));
  }

  Future<NotificationModeHistory> getNotifications() async {
    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      'Authorization': 'Bearer $userToken',
    };

    var response = await ApiService()
        .get('${baseUrl}api/v1/user/notifications', headers, client);
    return NotificationModeHistory.fromJson(json.decode(response.body));
  }

  Future<GuarantorListModel> getGuarantors() async {
    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      'Authorization': 'Bearer $userToken',
    };

    var response = await ApiService()
        .get('${baseUrl}api/v1/user/more/guarantors', headers, client);
    return GuarantorListModel.fromJson(json.decode(response.body));
  }

  Future<VirtualAccountModel> getBankDetails(String loanID) async {
    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      'Authorization': 'Bearer $userToken',
    };
    Map<String, String> payload = {"paymentMethod": "bank"};
    var response = await ApiService().post(
        '${baseUrl}api/v1/user/loan/$loanID/payment/process',
        payload,
        headers,
        client);
    return VirtualAccountModel.fromJson(json.decode(response.body));
  }

  Future<MessageModel> saveGuarantors(
      String name, email, phone, occupation, address) async {
    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      'Authorization': 'Bearer $userToken',
    };
    Map<String, String> payload = {
      "name": name,
      "email": email,
      "phone": phone,
      "occupation": occupation,
      "address": address
    };
    var response = await ApiService().post(
        '${baseUrl}api/v1/user/more/guarantors/create',
        payload,
        headers,
        client);
    return MessageModel.fromJson(json.decode(response.body));
  }
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
