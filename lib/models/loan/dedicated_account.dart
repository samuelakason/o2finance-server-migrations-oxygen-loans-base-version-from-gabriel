class DedicatedAccountModel {
  DedicatedAccountModel({
    required this.data,
    required this.message,
  });

  final Data? data;
  final String? message;

  factory DedicatedAccountModel.fromJson(Map<String, dynamic> json) {
    return DedicatedAccountModel(
      data: json["data"] == null ? null : Data.fromJson(json["data"]),
      message: json["message"],
    );
  }
}

class Data {
  Data({
    required this.accountBank,
    required this.accountName,
    required this.accountNumber,
  });

  final String? accountBank;
  final String? accountName;
  final String? accountNumber;

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      accountBank: json["accountBank"],
      accountName: json["accountName"],
      accountNumber: json["accountNumber"],
    );
  }
}
