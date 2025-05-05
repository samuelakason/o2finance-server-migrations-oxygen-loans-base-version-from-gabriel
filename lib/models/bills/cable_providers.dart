class CableProvidersModel {
  CableProvidersModel({
    required this.data,
    required this.message,
    required this.status,
  });

  final List<CableProivdersDatum> data;
  final String? message;
  final bool? status;

  factory CableProvidersModel.fromJson(Map<String, dynamic> json) {
    return CableProvidersModel(
      data: json["data"] == null
          ? []
          : List<CableProivdersDatum>.from(
              json["data"]!.map((x) => CableProivdersDatum.fromJson(x))),
      message: json["message"],
      status: json["status"],
    );
  }
}

class CableProivdersDatum {
  CableProivdersDatum({
    required this.providerId,
    required this.providerName,
    required this.providerMinimumAmount,
    required this.providerMaximumAmount,
    required this.providerAssetUrl,
    required this.providerVariationsEndpoint,
  });

  final String? providerId;
  final String? providerName;
  final dynamic? providerMinimumAmount;
  final dynamic? providerMaximumAmount;
  final dynamic? providerAssetUrl;
  final dynamic? providerVariationsEndpoint;

  factory CableProivdersDatum.fromJson(Map<String, dynamic> json) {
    return CableProivdersDatum(
      providerId: json["providerId"],
      providerName: json["providerName"],
      providerMinimumAmount: json["providerMinimumAmount"],
      providerMaximumAmount: json["providerMaximumAmount"],
      providerAssetUrl: json["providerAssetUrl"],
      providerVariationsEndpoint: json["providerVariationsEndpoint"],
    );
  }
}
