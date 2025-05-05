class NotificationModeHistory {
  NotificationModeHistory({
    required this.data,
    required this.message,
    required this.status,
  });

  final List<Datum> data;
  final String? message;
  final bool? status;

  factory NotificationModeHistory.fromJson(Map<String, dynamic> json) {
    return NotificationModeHistory(
      data: json["data"] == null
          ? []
          : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
      message: json["message"],
      status: json["status"],
    );
  }

  Map<String, dynamic> toJson() => {
        "data": data.map((x) => x?.toJson()).toList(),
        "message": message,
        "status": status,
      };
}

class Datum {
  Datum({
    required this.notificationId,
    required this.notificationMsg,
    required this.notificationView,
    required this.notificationStatus,
    required this.notificationEntry,
  });

  final String? notificationId;
  final String? notificationMsg;
  final dynamic notificationView;
  final String? notificationStatus;
  final DateTime? notificationEntry;

  factory Datum.fromJson(Map<String, dynamic> json) {
    return Datum(
      notificationId: json["notificationId"],
      notificationMsg: json["notificationMsg"],
      notificationView: json["notificationView"],
      notificationStatus: json["notificationStatus"],
      notificationEntry: DateTime.tryParse(json["notificationEntry"] ?? ""),
    );
  }

  Map<String, dynamic> toJson() => {
        "notificationId": notificationId,
        "notificationMsg": notificationMsg,
        "notificationView": notificationView,
        "notificationStatus": notificationStatus,
        "notificationEntry": notificationEntry?.toIso8601String(),
      };
}
