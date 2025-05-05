class ApiResponse {
  String name;
  String code;

  ApiResponse({
    required this.name,
    required this.code,
  });

  factory ApiResponse.fromJson(Map<String, dynamic> parsedJson) {
    return ApiResponse(
      name: parsedJson['name'].toString(),
      code: parsedJson['code'].toString(),
    );
  }
}
