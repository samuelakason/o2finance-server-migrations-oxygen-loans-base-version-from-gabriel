// To parse this JSON data, do
//
//     final authorizationChargeModel = authorizationChargeModelFromJson(jsonString);

import 'dart:convert';

AuthorizationChargeModel authorizationChargeModelFromJson(String str) =>
    AuthorizationChargeModel.fromJson(json.decode(str));

String authorizationChargeModelToJson(AuthorizationChargeModel data) =>
    json.encode(data.toJson());

class AuthorizationChargeModel {
  AuthorizationChargeModel({
    required this.status,
    required this.message,
    required this.data,
  });

  bool status;
  String message;
  Data data;

  factory AuthorizationChargeModel.fromJson(Map<String, dynamic> json) =>
      AuthorizationChargeModel(
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data.toJson(),
      };
}

class Data {
  Data({
    required this.amount,
    required this.currency,
    required this.transactionDate,
    required this.status,
    required this.reference,
    required this.domain,
    required this.metadata,
    required this.gatewayResponse,
    this.message,
    required this.channel,
    this.ipAddress,
    this.log,
    this.fees,
    required this.authorization,
    required this.customer,
    this.plan,
    required this.id,
  });

  int amount;
  String currency;
  DateTime transactionDate;
  String status;
  String reference;
  String domain;
  String metadata;
  String gatewayResponse;
  dynamic message;
  String channel;
  dynamic ipAddress;
  dynamic log;
  dynamic fees;
  Authorization authorization;
  Customer customer;
  dynamic plan;
  int id;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        amount: json["amount"],
        currency: json["currency"],
        transactionDate: DateTime.parse(json["transaction_date"]),
        status: json["status"],
        reference: json["reference"],
        domain: json["domain"],
        metadata: json["metadata"],
        gatewayResponse: json["gateway_response"],
        message: json["message"],
        channel: json["channel"],
        ipAddress: json["ip_address"],
        log: json["log"],
        fees: json["fees"],
        authorization: Authorization.fromJson(json["authorization"]),
        customer: Customer.fromJson(json["customer"]),
        plan: json["plan"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "amount": amount,
        "currency": currency,
        "transaction_date": transactionDate.toIso8601String(),
        "status": status,
        "reference": reference,
        "domain": domain,
        "metadata": metadata,
        "gateway_response": gatewayResponse,
        "message": message,
        "channel": channel,
        "ip_address": ipAddress,
        "log": log,
        "fees": fees,
        "authorization": authorization.toJson(),
        "customer": customer.toJson(),
        "plan": plan,
        "id": id,
      };
}

class Authorization {
  Authorization({
    required this.authorizationCode,
    required this.bin,
    required this.last4,
    required this.expMonth,
    required this.expYear,
    required this.channel,
    required this.cardType,
    required this.bank,
    required this.countryCode,
    required this.brand,
    required this.reusable,
    required this.signature,
    this.accountName,
  });

  String authorizationCode;
  String bin;
  String last4;
  String expMonth;
  String expYear;
  String channel;
  String cardType;
  String bank;
  String countryCode;
  String brand;
  bool reusable;
  String signature;
  dynamic accountName;

  factory Authorization.fromJson(Map<String, dynamic> json) => Authorization(
        authorizationCode: json["authorization_code"],
        bin: json["bin"],
        last4: json["last4"],
        expMonth: json["exp_month"],
        expYear: json["exp_year"],
        channel: json["channel"],
        cardType: json["card_type"],
        bank: json["bank"],
        countryCode: json["country_code"],
        brand: json["brand"],
        reusable: json["reusable"],
        signature: json["signature"],
        accountName: json["account_name"],
      );

  Map<String, dynamic> toJson() => {
        "authorization_code": authorizationCode,
        "bin": bin,
        "last4": last4,
        "exp_month": expMonth,
        "exp_year": expYear,
        "channel": channel,
        "card_type": cardType,
        "bank": bank,
        "country_code": countryCode,
        "brand": brand,
        "reusable": reusable,
        "signature": signature,
        "account_name": accountName,
      };
}

class Customer {
  Customer({
    required this.id,
    this.firstName,
    this.lastName,
    required this.email,
    required this.customerCode,
    this.phone,
    this.metadata,
    required this.riskAction,
    this.internationalFormatPhone,
  });

  int id;
  dynamic firstName;
  dynamic lastName;
  String email;
  String customerCode;
  dynamic phone;
  dynamic metadata;
  String riskAction;
  dynamic internationalFormatPhone;

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        email: json["email"],
        customerCode: json["customer_code"],
        phone: json["phone"],
        metadata: json["metadata"],
        riskAction: json["risk_action"],
        internationalFormatPhone: json["international_format_phone"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "customer_code": customerCode,
        "phone": phone,
        "metadata": metadata,
        "risk_action": riskAction,
        "international_format_phone": internationalFormatPhone,
      };
}
