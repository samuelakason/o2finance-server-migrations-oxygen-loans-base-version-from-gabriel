import 'dart:convert';

BvnModel bvnModelFromJson(String str) => BvnModel.fromJson(json.decode(str));

String bvnModelToJson(BvnModel data) => json.encode(data.toJson());

class BvnModel {
    BvnModel({
       required this.status,
       required this.message,
       required this.data,
       required this.meta,
    });

    bool status;
    String message;
    Data data;
    Meta meta;

    factory BvnModel.fromJson(Map<String, dynamic> json) => BvnModel(
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
        meta: Meta.fromJson(json["meta"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data.toJson(),
        "meta": meta.toJson(),
    };
}

class Data {
    Data({
      required  this.bvn,
      required  this.isBlacklisted,
       required this.accountNumber,
       required this.firstName,
       required this.lastName,
    });

    String bvn;
    bool isBlacklisted;
    bool accountNumber;
    bool firstName;
    bool lastName;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        bvn: json["bvn"],
        isBlacklisted: json["is_blacklisted"],
        accountNumber: json["account_number"],
        firstName: json["first_name"],
        lastName: json["last_name"],
    );

    Map<String, dynamic> toJson() => {
        "bvn": bvn,
        "is_blacklisted": isBlacklisted,
        "account_number": accountNumber,
        "first_name": firstName,
        "last_name": lastName,
    };
}

class Meta {
    Meta({
       required this.callsThisMonth,
       required this.freeCallsLeft,
    });

    int callsThisMonth;
    int freeCallsLeft;

    factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        callsThisMonth: json["calls_this_month"],
        freeCallsLeft: json["free_calls_left"],
    );

    Map<String, dynamic> toJson() => {
        "calls_this_month": callsThisMonth,
        "free_calls_left": freeCallsLeft,
    };
}
