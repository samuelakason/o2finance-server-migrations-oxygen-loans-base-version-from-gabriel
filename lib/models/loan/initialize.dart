class InitialiseLoanModel {
  InitialiseLoanModel({
    required this.data,
    required this.message,
    required this.status,
  });

  final Data? data;
  final String? message;
  final bool? status;

  factory InitialiseLoanModel.fromJson(Map<String, dynamic> json) {
    return InitialiseLoanModel(
      data: json["data"] == null ? null : Data.fromJson(json["data"]),
      message: json["message"],
      status: json["status"],
    );
  }
}

class Data {
  Data({
    required this.verified,
    required this.hasPendingLoan,
    required this.hasActiveLoan,
    required this.limit,
    required this.paymentPlans,
  });

  final bool? verified;
  final bool? hasPendingLoan;
  final bool? hasActiveLoan;
  final String? limit;
  final List<PaymentPlan> paymentPlans;

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      verified: json["verified"],
      hasPendingLoan: json["hasPendingLoan"],
      hasActiveLoan: json["hasActiveLoan"],
      limit: json["limit"],
      paymentPlans: json["paymentPlans"] == null
          ? []
          : List<PaymentPlan>.from(
              json["paymentPlans"]!.map((x) => PaymentPlan.fromJson(x))),
    );
  }
}

class PaymentPlan {
  PaymentPlan({
    required this.planId,
    required this.planName,
    required this.planInterestRate,
    required this.planDuration,
    required this.planDescription,
    required this.planDueDate,
  });

  final num? planId;
  final String? planName;
  final String? planInterestRate;
  final String? planDuration;
  final String? planDescription;
  final String? planDueDate;

  factory PaymentPlan.fromJson(Map<String, dynamic> json) {
    return PaymentPlan(
      planId: json["planId"],
      planName: json["planName"],
      planInterestRate: json["planInterestRate"],
      planDuration: json["planDuration"],
      planDescription: json["planDescription"],
      planDueDate: json["planDueDate"],
    );
  }
}
