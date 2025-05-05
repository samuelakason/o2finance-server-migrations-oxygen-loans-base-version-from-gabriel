class BankListModel {
  BankListModel({
    required this.status,
    required this.message,
    required this.data,
  });

  final bool? status;
  final String? message;
  final List<AppBankList> data;

  factory BankListModel.fromJson(Map<String, dynamic> json) {
    return BankListModel(
      status: json["status"],
      message: json["message"],
      data: json["data"] == null
          ? []
          : List<AppBankList>.from(
              json["data"]!.map((x) => AppBankList.fromJson(x))),
    );
  }
}

class AppBankList {
  AppBankList({
    required this.name,
    required this.code,
    required this.longcode,
  });

  final String? name;
  final String? code;
  final String? longcode;

  factory AppBankList.fromJson(Map<String, dynamic> json) {
    return AppBankList(
      name: json["name"],
      code: json["code"],
      longcode: json["longcode"],
    );
  }
}
