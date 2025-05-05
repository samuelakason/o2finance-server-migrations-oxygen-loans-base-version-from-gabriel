class GuarantorListModel {
  GuarantorListModel({
    required this.data,
    required this.message,
    required this.status,
  });

  final List<GuarantorDatum> data;
  final String? message;
  final bool? status;

  factory GuarantorListModel.fromJson(Map<String, dynamic> json) {
    return GuarantorListModel(
      data: json["data"] == null
          ? []
          : List<GuarantorDatum>.from(
              json["data"]!.map((x) => GuarantorDatum.fromJson(x))),
      message: json["message"],
      status: json["status"],
    );
  }

  Map<String, dynamic> toJson() => {
        "data": data.map((x) => x?.toJson()).toList(),
        "message": message,
        "status": status,
      };
}

class GuarantorDatum {
  GuarantorDatum({
    required this.guarantorId,
    required this.guarantorName,
    required this.guarantorEmail,
    required this.guarantorPhoneNumber,
    required this.guarantorOccupation,
    required this.guarantorAddress,
    required this.guarantorStatus,
  });

  final int? guarantorId;
  final String? guarantorName;
  final String? guarantorEmail;
  final String? guarantorPhoneNumber;
  final String? guarantorOccupation;
  final String? guarantorAddress;
  final String? guarantorStatus;

  factory GuarantorDatum.fromJson(Map<String, dynamic> json) {
    return GuarantorDatum(
      guarantorId: json["guarantorId"],
      guarantorName: json["guarantorName"],
      guarantorEmail: json["guarantorEmail"],
      guarantorPhoneNumber: json["guarantorPhoneNumber"],
      guarantorOccupation: json["guarantorOccupation"],
      guarantorAddress: json["guarantorAddress"],
      guarantorStatus: json["guarantorStatus"],
    );
  }

  Map<String, dynamic> toJson() => {
        "guarantorId": guarantorId,
        "guarantorName": guarantorName,
        "guarantorEmail": guarantorEmail,
        "guarantorPhoneNumber": guarantorPhoneNumber,
        "guarantorOccupation": guarantorOccupation,
        "guarantorAddress": guarantorAddress,
        "guarantorStatus": guarantorStatus,
      };
}
