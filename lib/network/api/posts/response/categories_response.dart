class CategoriesData{
  final List<CategoriesResponse> categories;

  const CategoriesData({
    this.categories = const[],
});

    factory CategoriesData.fromJson(List<dynamic> json) => CategoriesData(
      categories: json.map((item) => CategoriesResponse.fromJson(item)).toList(),
  );

}
class CategoriesResponse {
  final int? id;
  final String? name;
  final String? icon;

  CategoriesResponse({
    this.id,
    this.name,
    this.icon,
  });

  factory CategoriesResponse.fromJson(Map<String, dynamic> json) => CategoriesResponse(
    id: json["id"],
    name: json["name"],
    icon: json["icon"],
  );
}
