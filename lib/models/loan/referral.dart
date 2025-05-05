class ReferrallModel {
  ReferrallModel({
    required this.data,
    required this.message,
    required this.status,
  });

  final Data? data;
  final String? message;
  final bool? status;

  factory ReferrallModel.fromJson(Map<String, dynamic> json) {
    return ReferrallModel(
      data: json["data"] == null ? null : Data.fromJson(json["data"]),
      message: json["message"],
      status: json["status"],
    );
  }
}

class Data {
  Data({
    required this.referralCode,
    required this.referrals,
  });

  final String? referralCode;
  final List<Referral> referrals;

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      referralCode: json["referralCode"],
      referrals: json["referrals"] == null
          ? []
          : List<Referral>.from(
              json["referrals"]!.map((x) => Referral.fromJson(x))),
    );
  }
}

class Referral {
  Referral({
    required this.referredId,
    required this.referredName,
    required this.referredAvatar,
    required this.referredCommission,
    required this.referredDated,
  });

  final num? referredId;
  final String? referredName;
  final String? referredAvatar;
  final String? referredCommission;
  final DateTime? referredDated;

  factory Referral.fromJson(Map<String, dynamic> json) {
    return Referral(
      referredId: json["referredId"],
      referredName: json["referredName"],
      referredAvatar: json["referredAvatar"],
      referredCommission: json["referredCommission"],
      referredDated: DateTime.tryParse(json["referredDated"] ?? ""),
    );
  }
}
