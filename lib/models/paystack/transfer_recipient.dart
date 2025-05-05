// To parse this JSON data, do
//
//     final transferRecipientModel = transferRecipientModelFromJson(jsonString);

import 'dart:convert';

TransferRecipientModel transferRecipientModelFromJson(String str) =>
    TransferRecipientModel.fromJson(json.decode(str));

String transferRecipientModelToJson(TransferRecipientModel data) =>
    json.encode(data.toJson());

class TransferRecipientModel {
  TransferRecipientModel({
    required this.status,
    required this.message,
    required this.data,
  });

  bool status;
  String message;
  Data data;

  factory TransferRecipientModel.fromJson(Map<String, dynamic> json) =>
      TransferRecipientModel(
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
    required this.active,
    required this.createdAt,
    required this.currency,
    this.description,
    required this.domain,
    this.email,
    required this.id,
    required this.integration,
    this.metadata,
    required this.name,
    required this.recipientCode,
    required this.type,
    required this.updatedAt,
    required this.dataIsDeleted,
    required this.isDeleted,
    required this.details,
  });

  bool active;
  DateTime createdAt;
  String currency;
  dynamic description;
  String domain;
  dynamic email;
  int id;
  int integration;
  dynamic metadata;
  String name;
  String recipientCode;
  String type;
  DateTime updatedAt;
  bool dataIsDeleted;
  bool isDeleted;
  Details details;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        active: json["active"],
        createdAt: DateTime.parse(json["createdAt"]),
        currency: json["currency"],
        description: json["description"],
        domain: json["domain"],
        email: json["email"],
        id: json["id"],
        integration: json["integration"],
        metadata: json["metadata"],
        name: json["name"],
        recipientCode: json["recipient_code"],
        type: json["type"],
        updatedAt: DateTime.parse(json["updatedAt"]),
        dataIsDeleted: json["is_deleted"],
        isDeleted: json["isDeleted"],
        details: Details.fromJson(json["details"]),
      );

  Map<String, dynamic> toJson() => {
        "active": active,
        "createdAt": createdAt.toIso8601String(),
        "currency": currency,
        "description": description,
        "domain": domain,
        "email": email,
        "id": id,
        "integration": integration,
        "metadata": metadata,
        "name": name,
        "recipient_code": recipientCode,
        "type": type,
        "updatedAt": updatedAt.toIso8601String(),
        "is_deleted": dataIsDeleted,
        "isDeleted": isDeleted,
        "details": details.toJson(),
      };
}

class Details {
  Details({
    this.authorizationCode,
    required this.accountNumber,
    required this.accountName,
    required this.bankCode,
    required this.bankName,
  });

  dynamic authorizationCode;
  String accountNumber;
  String accountName;
  String bankCode;
  String bankName;

  factory Details.fromJson(Map<String, dynamic> json) => Details(
        authorizationCode: json["authorization_code"],
        accountNumber: json["account_number"],
        accountName: json["account_name"],
        bankCode: json["bank_code"],
        bankName: json["bank_name"],
      );

  Map<String, dynamic> toJson() => {
        "authorization_code": authorizationCode,
        "account_number": accountNumber,
        "account_name": accountName,
        "bank_code": bankCode,
        "bank_name": bankName,
      };
}
