// To parse this JSON data, do
//
//     final makeTransferModel = makeTransferModelFromJson(jsonString);

import 'dart:convert';

MakeTransferModel makeTransferModelFromJson(String str) =>
    MakeTransferModel.fromJson(json.decode(str));

String makeTransferModelToJson(MakeTransferModel data) =>
    json.encode(data.toJson());

class MakeTransferModel {
  MakeTransferModel({
    required this.status,
    required this.message,
    required this.data,
  });

  bool status;
  String message;
  Data data;

  factory MakeTransferModel.fromJson(Map<String, dynamic> json) =>
      MakeTransferModel(
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
    required this.transfersessionid,
    required this.domain,
    required this.amount,
    required this.currency,
    required this.reference,
    required this.source,
    this.sourceDetails,
    required this.reason,
    required this.status,
    this.failures,
    required this.transferCode,
    this.titanCode,
    this.transferredAt,
    required this.id,
    required this.integration,
    required this.request,
    required this.recipient,
    required this.createdAt,
    required this.updatedAt,
  });

  List<dynamic> transfersessionid;
  String domain;
  int amount;
  String currency;
  String reference;
  String source;
  dynamic sourceDetails;
  String reason;
  String status;
  dynamic failures;
  String transferCode;
  dynamic titanCode;
  dynamic transferredAt;
  int id;
  int integration;
  int request;
  int recipient;
  DateTime createdAt;
  DateTime updatedAt;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        transfersessionid:
            List<dynamic>.from(json["transfersessionid"].map((x) => x)),
        domain: json["domain"],
        amount: json["amount"],
        currency: json["currency"],
        reference: json["reference"],
        source: json["source"],
        sourceDetails: json["source_details"],
        reason: json["reason"],
        status: json["status"],
        failures: json["failures"],
        transferCode: json["transfer_code"],
        titanCode: json["titan_code"],
        transferredAt: json["transferred_at"],
        id: json["id"],
        integration: json["integration"],
        request: json["request"],
        recipient: json["recipient"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "transfersessionid":
            List<dynamic>.from(transfersessionid.map((x) => x)),
        "domain": domain,
        "amount": amount,
        "currency": currency,
        "reference": reference,
        "source": source,
        "source_details": sourceDetails,
        "reason": reason,
        "status": status,
        "failures": failures,
        "transfer_code": transferCode,
        "titan_code": titanCode,
        "transferred_at": transferredAt,
        "id": id,
        "integration": integration,
        "request": request,
        "recipient": recipient,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };
}
