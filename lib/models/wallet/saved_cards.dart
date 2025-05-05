class SavedCardModel {
  SavedCardModel({
    required this.data,
    required this.message,
    required this.status,
  });

  final List<Datum> data;
  final String? message;
  final bool? status;

  factory SavedCardModel.fromJson(Map<String, dynamic> json) {
    return SavedCardModel(
      data: json["data"] == null
          ? []
          : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
      message: json["message"],
      status: json["status"],
    );
  }
}

class Datum {
  Datum({
    required this.cardId,
    required this.cardType,
    required this.cardNumber,
    required this.cardExpiringMonth,
    required this.cardExpiringYear,
  });

  final num? cardId;
  final String? cardType;
  final String? cardNumber;
  final String? cardExpiringMonth;
  final String? cardExpiringYear;

  factory Datum.fromJson(Map<String, dynamic> json) {
    return Datum(
      cardId: json["cardId"],
      cardType: json["cardType"],
      cardNumber: json["cardNumber"],
      cardExpiringMonth: json["cardExpiringMonth"],
      cardExpiringYear: json["cardExpiringYear"],
    );
  }
}
