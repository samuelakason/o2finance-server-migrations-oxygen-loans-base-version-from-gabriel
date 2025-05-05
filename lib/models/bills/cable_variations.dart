class CableVariationsModel {
  CableVariationsModel({
    required this.data,
    required this.message,
    required this.status,
  });

  final List<Datum> data;
  final String? message;
  final bool? status;

  factory CableVariationsModel.fromJson(Map<String, dynamic> json) {
    return CableVariationsModel(
      data: json["data"] == null
          ? []
          : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
      message: json["message"],
      status: json["status"],
    );
  }
}

class Datum {
  Datum({
    required this.providerId,
    required this.variationCode,
    required this.variationName,
    required this.variationCost,
    required this.variationBuyEndpoint,
  });

  final String? providerId;
  final String? variationCode;
  final String? variationName;
  final String? variationCost;
  final String? variationBuyEndpoint;

  factory Datum.fromJson(Map<String, dynamic> json) {
    return Datum(
      providerId: json["providerId"],
      variationCode: json["variationCode"],
      variationName: json["variationName"],
      variationCost: json["variationCost"],
      variationBuyEndpoint: json["variationBuyEndpoint"],
    );
  }
}
