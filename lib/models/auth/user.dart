class UserModel {
  UserModel({
    required this.data,
    required this.message,
    required this.status,
  });

  final Data? data;
  final String? message;
  final bool? status;

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
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
    required this.id,
    required this.manager,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
    //  required this.dob,
    required this.bvn,
    required this.address,
    required this.avatar,
    required this.referralCode,
    required this.fcmToken,
    required this.pushEnabled,
    required this.createdAt,
    required this.updatedAt,
    required this.token,
  });

  final int? id;
  final int? manager;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? phoneNumber;
  //  final DateTime? dob;
  final String? bvn;
  final dynamic address;
  final dynamic avatar;
  final dynamic referralCode;
  final dynamic fcmToken;
  final int? pushEnabled;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? token;

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id: json["id"],
      manager: json["manager"],
      firstName: json["first_name"],
      lastName: json["last_name"],
      email: json["email"],
      phoneNumber: json["phone_number"],
      //  dob: DateTime.tryParse(json["dob"] ?? ""),
      bvn: json["bvn"],
      address: json["address"],
      avatar: json["avatar"],
      referralCode: json["referral_code"],
      fcmToken: json["fcm_token"],
      pushEnabled: json["push_enabled"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
      token: json["token"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "manager": manager,
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "phone_number": phoneNumber,
        //  "dob": "${dob.year.toString().padLeft(4'0')}-${dob.month.toString().padLeft(2'0')}-${dob.day.toString().padLeft(2'0')}",
        "bvn": bvn,
        "address": address,
        "avatar": avatar,
        "referral_code": referralCode,
        "fcm_token": fcmToken,
        "push_enabled": pushEnabled,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "token": token,
      };
}
