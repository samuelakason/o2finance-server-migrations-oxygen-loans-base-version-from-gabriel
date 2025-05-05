class ProfileUpdateModel {
  ProfileUpdateModel({
    required this.data,
    required this.message,
    required this.status,
  });

  final Data? data;
  final String? message;
  final bool? status;

  factory ProfileUpdateModel.fromJson(Map<String, dynamic> json) {
    return ProfileUpdateModel(
      data: json["data"] == null ? null : Data.fromJson(json["data"]),
      message: json["message"],
      status: json["status"],
    );
  }
}

class Data {
  Data({
    required this.userId,
    required this.firstName,
    required this.lastName,
    required this.emailAddress,
    required this.phoneNumber,
    required this.avatar,
  });

  final num? userId;
  final String? firstName;
  final String? lastName;
  final String? emailAddress;
  final String? phoneNumber;
  final String? avatar;

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      userId: json["userId"],
      firstName: json["firstName"],
      lastName: json["lastName"],
      emailAddress: json["emailAddress"],
      phoneNumber: json["phoneNumber"],
      avatar: json["avatar"],
    );
  }
}
