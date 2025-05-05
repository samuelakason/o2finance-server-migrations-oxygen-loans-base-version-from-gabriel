class ResolveAccountModel {
  ResolveAccountModel({
    required this.status,
    required this.message,
    required this.data,
  });

  final bool? status;
  final String? message;
  final Data? data;

  factory ResolveAccountModel.fromJson(Map<String, dynamic> json) {
    return ResolveAccountModel(
      status: json["status"],
      message: json["message"],
      data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );
  }
}

class Data {
  Data({
    required this.accountNumber,
    required this.accountName,
    required this.bankId,
  });

  final String? accountNumber;
  final String? accountName;
  final int? bankId;

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      accountNumber: json["account_number"],
      accountName: json["account_name"],
      bankId: json["bank_id"],
    );
  }
}
