class RegistrerModel {
  RegistrerModel({
    required this.data,
    required this.message,
    required this.status,
  });

  final Data? data;
  final String? message;
  final bool? status;

  factory RegistrerModel.fromJson(Map<String, dynamic> json) {
    return RegistrerModel(
      data: json["data"] == null ? null : Data.fromJson(json["data"]),
      message: json["message"],
      status: json["status"],
    );
  }
}

class Data {
  Data({
    required this.userId,
    required this.email,
    required this.phone,
  });

  final int? userId;
  final String? email;
  final String? phone;

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      userId: json["user_id"],
      email: json["email"],
      phone: json["phone"],
    );
  }
}
