class LoanPaymentModel {
  LoanPaymentModel({
    required this.data,
    required this.message,
    required this.status,
  });

  final List<String> data;
  final String? message;
  final bool? status;

  factory LoanPaymentModel.fromJson(Map<String, dynamic> json) {
    return LoanPaymentModel(
      data: json["data"] == null
          ? []
          : List<String>.from(json["data"]!.map((x) => x)),
      message: json["message"],
      status: json["status"],
    );
  }
}
