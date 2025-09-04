class TokenQuery {
  final String token;

  TokenQuery({
    required this.token,
  });

  Map<String, dynamic> toJson() => {
    "token": token,
  };
}
