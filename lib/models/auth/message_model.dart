class MessageModel {
  MessageModel({
    required this.message,
    required this.status,
  });

  final String? message;
  final bool? status;

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      message: json["message"],
      status: json["status"],
    );
  }
}
