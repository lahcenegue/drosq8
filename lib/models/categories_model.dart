class CategoriesModel {
  final String name;
  final String id;
  final String category;
  final String type;

  CategoriesModel({
    required this.name,
    required this.id,
    required this.category,
    required this.type,
  });

  factory CategoriesModel.fromJson(Map<String, dynamic> json) {
    return CategoriesModel(
      name: json['catname'],
      id: json['catid'],
      category: json['cat'],
      type: json['type'],
    );
  }
}
