class ConfirmAccount {
  String account_number;
  String account_name;

  ConfirmAccount({
    required this.account_number,
    required this.account_name,
  });

  factory ConfirmAccount.fromJson(Map<String, dynamic> parsedJson) {
    return ConfirmAccount(
      account_number: parsedJson['account_number'].toString(),
      account_name: parsedJson['account_name'].toString(),
    );
  }
}
