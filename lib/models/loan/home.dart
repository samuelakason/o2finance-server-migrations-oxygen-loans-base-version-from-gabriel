class HomeModel {
  HomeModel({
    required this.data,
    required this.message,
    required this.status,
  });

  final Data? data;
  final String? message;
  final bool? status;

  factory HomeModel.fromJson(Map<String, dynamic> json) {
    return HomeModel(
      data: json["data"] == null ? null : Data.fromJson(json["data"]),
      message: json["message"],
      status: json["status"],
    );
  }
}

class Data {
  Data({
    required this.balance,
    required this.loan,
    required this.investment,
  });

  final String? balance;
  final String? loan;
  final Investment? investment;

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      balance: json["balance"],
      loan: json["loan"],
      investment: json["investment"] == null
          ? null
          : Investment.fromJson(json["investment"]),
    );
  }
}

class Investment {
  Investment({
    required this.balance,
    required this.activePlans,
  });

  final String? balance;
  final num? activePlans;

  factory Investment.fromJson(Map<String, dynamic> json) {
    return Investment(
      balance: json["balance"],
      activePlans: json["activePlans"],
    );
  }
}
