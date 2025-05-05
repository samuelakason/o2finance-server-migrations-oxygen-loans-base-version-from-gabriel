class AirtimeProvidersModel {
  AirtimeProvidersModel({
    required this.data,
    required this.message,
    required this.status,
  });

  final List<AirtimeDatum> data;
  final String? message;
  final bool? status;

  factory AirtimeProvidersModel.fromJson(Map<String, dynamic> json) {
    return AirtimeProvidersModel(
      data: json["data"] == null
          ? []
          : List<AirtimeDatum>.from(
              json["data"]!.map((x) => AirtimeDatum.fromJson(x))),
      message: json["message"],
      status: json["status"],
    );
  }
}

class AirtimeDatum {
  AirtimeDatum({
    required this.providerId,
    required this.providerName,
    required this.providerMinimumAmount,
    required this.providerMaximumAmount,
    required this.providerAssetUrl,
    required this.providerBuyEndpoint,
  });

  final dynamic? providerId;
  final dynamic? providerName;
  final dynamic? providerMinimumAmount;
  final dynamic? providerMaximumAmount;
  final dynamic? providerAssetUrl;
  final dynamic? providerBuyEndpoint;

  factory AirtimeDatum.fromJson(Map<String, dynamic> json) {
    return AirtimeDatum(
      providerId: json["providerId"],
      providerName: json["providerName"],
      providerMinimumAmount: json["providerMinimumAmount"],
      providerMaximumAmount: json["providerMaximumAmount"],
      providerAssetUrl: json["providerAssetUrl"],
      providerBuyEndpoint: json["providerBuyEndpoint"],
    );
  }
}
