class BaseError  implements Exception{
  final String? error;
  final String? message;
  final int? statusCode;

  BaseError({
    this.error,
    this.message,
    this.statusCode,
  });

  factory BaseError.fromJson(Map<String, dynamic> json) => BaseError(
    error: json["error"],
    message: json["message"],
    statusCode: json["statusCode"],
  );
}
