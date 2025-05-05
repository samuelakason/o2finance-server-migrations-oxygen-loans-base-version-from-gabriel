class BuyElectrictyModel {
  BuyElectrictyModel({
    required this.data,
    required this.message,
    required this.status,
  });

  final Data? data;
  final String? message;
  final bool? status;

  factory BuyElectrictyModel.fromJson(Map<String, dynamic> json) {
    return BuyElectrictyModel(
      data: json["data"] == null ? null : Data.fromJson(json["data"]),
      message: json["message"],
      status: json["status"],
    );
  }

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
        "message": message,
        "status": status,
      };
}

class Data {
  Data({
    required this.providerId,
    required this.meterType,
    required this.meterNumber,
    required this.purchaseCode,
  });

  final String? providerId;
  final String? meterType;
  final String? meterNumber;
  final String? purchaseCode;

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      providerId: json["providerId"],
      meterType: json["meterType"],
      meterNumber: json["meterNumber"],
      purchaseCode: json["purchaseCode"],
    );
  }

  Map<String, dynamic> toJson() => {
        "providerId": providerId,
        "meterType": meterType,
        "meterNumber": meterNumber,
        "purchaseCode": purchaseCode,
      };
}
