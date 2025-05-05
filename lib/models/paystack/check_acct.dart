// To parse this JSON data, do
//
//     final checkAcctNumberModel = checkAcctNumberModelFromJson(jsonString);

import 'dart:convert';

CheckAcctNumberModel checkAcctNumberModelFromJson(String str) =>
    CheckAcctNumberModel.fromJson(json.decode(str));

String checkAcctNumberModelToJson(CheckAcctNumberModel data) =>
    json.encode(data.toJson());

class CheckAcctNumberModel {
  CheckAcctNumberModel({
    required this.status,
    required this.message,
    required this.data,
  });

  bool status;
  String message;
  Data data;

  factory CheckAcctNumberModel.fromJson(Map<String, dynamic> json) =>
      CheckAcctNumberModel(
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
    required this.accountNumber,
    required this.accountName,
    required this.bankId,
  });

  String accountNumber;
  String accountName;
  int bankId;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        accountNumber: json["account_number"],
        accountName: json["account_name"],
        bankId: json["bank_id"],
      );

  Map<String, dynamic> toJson() => {
        "account_number": accountNumber,
        "account_name": accountName,
        "bank_id": bankId,
      };
}
