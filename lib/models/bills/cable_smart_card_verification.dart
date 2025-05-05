class CableSmartcardVerificatioModel {
  CableSmartcardVerificatioModel({
    required this.data,
    required this.message,
    required this.status,
  });

  final Data? data;
  final String? message;
  final bool? status;

  factory CableSmartcardVerificatioModel.fromJson(Map<String, dynamic> json) {
    return CableSmartcardVerificatioModel(
      data: json["data"] == null ? null : Data.fromJson(json["data"]),
      message: json["message"],
      status: json["status"],
    );
  }
}

class Data {
  Data({
    required this.customerName,
    required this.status,
    required this.dueDate,
    required this.customerNumber,
    required this.customerType,
    required this.currentBouquet,
    required this.currentBouquetCode,
    required this.renewalAmount,
  });

  final String? customerName;
  final String? status;
  final String? dueDate;
  final num? customerNumber;
  final String? customerType;
  final String? currentBouquet;
  final String? currentBouquetCode;
  final num? renewalAmount;

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      customerName: json["Customer_Name"],
      status: json["Status"],
      dueDate: json["Due_Date"],
      customerNumber: json["Customer_Number"],
      customerType: json["Customer_Type"],
      currentBouquet: json["Current_Bouquet"],
      currentBouquetCode: json["Current_Bouquet_Code"],
      renewalAmount: json["Renewal_Amount"],
    );
  }
}
