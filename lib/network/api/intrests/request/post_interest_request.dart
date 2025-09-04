class PostInterestRequest {
  final List<int> interests;

  PostInterestRequest({
    required this.interests,
  });

  Map<String, dynamic> toJson() => {
    "interests":  List<int>.from(interests.map((x) => x)),
  };
}
