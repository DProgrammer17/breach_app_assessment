class AuthResponse {
  final String? token;
  final int? userId;

  AuthResponse({
    this.token,
    this.userId,
  });

  factory AuthResponse.fromJson(Map<String, dynamic> json) => AuthResponse(
    token: json["token"],
    userId: json["userId"],
  );
}
