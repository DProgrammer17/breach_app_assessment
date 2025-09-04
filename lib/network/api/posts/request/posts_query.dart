class PostsQuery {
  final int? categoryId;

  PostsQuery({
    this.categoryId,
  });

  Map<String, dynamic> toJson() => {
    "categoryId": categoryId,
  };
}
