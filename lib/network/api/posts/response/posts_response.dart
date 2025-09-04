
class PostsData {
  final List<PostsResponse> posts;

  const PostsData({
    this.posts = const [],
  });

  factory PostsData.fromJson(List<dynamic> json) => PostsData(
    posts: json.map((item) => PostsResponse.fromJson(item)).toList(),
  );
}

class PostsResponse {
  final int? id;
  final String? title;
  final String? content;
  final String? imageUrl;
  final DateTime? createdAt;
  final Author? author;
  final Category? category;
  final Author? series;

  PostsResponse({
    this.id,
    this.title,
    this.content,
    this.imageUrl,
    this.createdAt,
    this.author,
    this.category,
    this.series,
  });

  factory PostsResponse.fromJson(Map<String, dynamic> json) => PostsResponse(
    id: json["id"],
    title: json["title"],
    content: json["content"],
    imageUrl: json["imageUrl"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    author: json["author"] == null ? null : Author.fromJson(json["author"]),
    category: json["category"] == null ? null : Category.fromJson(json["category"]),
    series: json["series"] == null ? null : Author.fromJson(json["series"]),
  );
}

class Author {
  final int? id;
  final String? name;

  Author({
    this.id,
    this.name,
  });

  factory Author.fromJson(Map<String, dynamic> json) => Author(
    id: json["id"],
    name: json["name"],
  );
}

class Category {
  final int? id;
  final String? name;
  final String? icon;

  Category({
    this.id,
    this.name,
    this.icon,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["id"],
    name: json["name"],
    icon: json["icon"],
  );
}
