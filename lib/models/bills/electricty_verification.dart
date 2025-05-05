class ElectrictyVerificationModel {
  ElectrictyVerificationModel({
    required this.data,
    required this.message,
    required this.status,
  });

  final Data? data;
  final String? message;
  final bool? status;

  factory ElectrictyVerificationModel.fromJson(Map<String, dynamic> json) {
    return ElectrictyVerificationModel(
      data: json["data"] == null ? null : Data.fromJson(json["data"]),
      message: json["message"],
      status: json["status"],
    );
  }
}

class Data {
  Data({
    required this.customerName,
    required this.meterNumber,
    required this.customerDistrict,
    required this.address,
  });

  final String? customerName;
  final dynamic meterNumber;
  final String? customerDistrict;
  final String? address;

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      customerName: json["Customer_Name"],
      meterNumber: json["Meter_Number"],
      customerDistrict: json["Customer_District"],
      address: json["Address"],
    );
  }
}
