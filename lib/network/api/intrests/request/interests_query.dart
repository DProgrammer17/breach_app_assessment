class InterestQuery {
  final int id;

  InterestQuery({
    required this.id,
  });

  factory InterestQuery.fromJson(Map<String, dynamic> json) => InterestQuery(
    id: json["id"],
  );
}
