class CategoriesModel {
  final String name;
  CategoriesModel({required this.name});

  factory CategoriesModel.fromJson(String json) {
    return CategoriesModel(name: json);
  }
}
