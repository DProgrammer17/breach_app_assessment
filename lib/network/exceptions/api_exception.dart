class ApiException implements Exception {
  ApiException({
    this.message,
  });

  String? message;

  factory ApiException.fromJson(Map<String, dynamic> json) =>
      ApiException(
        message: json["message"],
      );

  @override
  String toString() {
    switch (message) {
      case "Invalid email":
        return "you have an invalid email";
      default:
        return message ?? '';
    }
  }
}
