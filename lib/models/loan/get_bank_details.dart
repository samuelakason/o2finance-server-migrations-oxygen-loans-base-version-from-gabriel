class VirtualAccountModel {
  VirtualAccountModel({
    required this.data,
    required this.message,
    required this.status,
  });

  final Data? data;
  final String? message;
  final bool? status;

  factory VirtualAccountModel.fromJson(Map<String, dynamic> json) {
    return VirtualAccountModel(
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

  Map<String, dynamic> toJson() => {
        "accountBank": accountBank,
        "accountName": accountName,
        "accountNumber": accountNumber,
      };
}
