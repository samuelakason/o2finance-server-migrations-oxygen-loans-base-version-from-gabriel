class InitSaveCardModel {
  InitSaveCardModel({
    required this.data,
    required this.message,
    required this.status,
  });

  final Data? data;
  final String? message;
  final bool? status;

  factory InitSaveCardModel.fromJson(Map<String, dynamic> json) {
    return InitSaveCardModel(
      data: json["data"] == null ? null : Data.fromJson(json["data"]),
      message: json["message"],
      status: json["status"],
    );
  }
}

class Data {
  Data({
    required this.key,
    required this.ref,
    required this.amount,
    required this.email,
    required this.currency,
    required this.label,
    required this.verifyUrl,
    required this.channel,
  });

  final String? key;
  final String? ref;
  final num? amount;
  final String? email;
  final String? currency;
  final String? label;
  final String? verifyUrl;
  final String? channel;

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      key: json["key"],
      ref: json["ref"],
      amount: json["amount"],
      email: json["email"],
      currency: json["currency"],
      label: json["label"],
      verifyUrl: json["verify_url"],
      channel: json["channel"],
    );
  }
}
