import 'package:breach_assessment/network/api/posts/response/posts_response.dart';

class InterestsData {
  final List<InterestResponse> interests;

  const InterestsData({
    this.interests = const [],
  });

  factory InterestsData.fromJson(List<dynamic> json) => InterestsData(
    interests: json.map((item) => InterestResponse.fromJson(item)).toList(),
  );
}

class InterestResponse {
  final int? id;
  final User? user;
  final Category? category;

  InterestResponse({
    this.id,
    this.user,
    this.category,
  });

  factory InterestResponse.fromJson(Map<String, dynamic> json) => InterestResponse(
    id: json["id"],
    user: json["user"] == null ? null : User.fromJson(json["user"]),
    category: json["category"] == null ? null : Category.fromJson(json["category"]),
  );
}

class User {
  final int? id;
  final String? email;

  User({
    this.id,
    this.email,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    email: json["email"],
  );
}

