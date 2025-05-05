class ElectrictyProviderModel {
  ElectrictyProviderModel({
    required this.data,
    required this.message,
    required this.status,
  });

  final List<Datum> data;
  final String? message;
  final bool? status;

  factory ElectrictyProviderModel.fromJson(Map<String, dynamic> json) {
    return ElectrictyProviderModel(
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
    required this.providerName,
    required this.providerServiceFee,
    required this.providerMinimumAmount,
    required this.providerMaximumAmount,
    required this.providerAssetUrl,
    required this.providerBuyEndpoint,
  });

  final String? providerId;
  final String? providerName;
  final ProviderServiceFee? providerServiceFee;
  final dynamic? providerMinimumAmount;
  final dynamic? providerMaximumAmount;
  final dynamic? providerAssetUrl;
  final dynamic? providerBuyEndpoint;

  factory Datum.fromJson(Map<String, dynamic> json) {
    return Datum(
      providerId: json["providerId"],
      providerName: json["providerName"],
      providerServiceFee: json["providerServiceFee"] == null
          ? null
          : ProviderServiceFee.fromJson(json["providerServiceFee"]),
      providerMinimumAmount: json["providerMinimumAmount"],
      providerMaximumAmount: json["providerMaximumAmount"],
      providerAssetUrl: json["providerAssetUrl"],
      providerBuyEndpoint: json["providerBuyEndpoint"],
    );
  }
}

class ProviderServiceFee {
  ProviderServiceFee({
    required this.feeRaw,
    required this.feeFormatted,
  });

  final num? feeRaw;
  final String? feeFormatted;

  factory ProviderServiceFee.fromJson(Map<String, dynamic> json) {
    return ProviderServiceFee(
      feeRaw: json["feeRaw"],
      feeFormatted: json["feeFormatted"],
    );
  }
}
