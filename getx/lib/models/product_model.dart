class ProductModel {
  final int id;
  final String title;
  final double price;
  final String description;
  final String category;
  final String image;
  final RatingModel ratingModel;

  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.ratingModel,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] ?? 0,
      title: json['title'] ?? 'no title',
      price: json['price'] != null ? (json['price'] as num).toDouble() : 0.0,
      description: json['description'] ?? 'no desc',
      category: json['category'] ?? 'no category',
      image: json['image'] ?? 'no image',
      ratingModel: RatingModel.fromJson(json['ratingmodel'] ?? {}),
    );
  }
}

class RatingModel {
  final double rate;
  final int count;

  RatingModel({required this.rate, required this.count});

  factory RatingModel.fromJson(Map<String, dynamic> json) {
    return RatingModel(
      rate: json['rate'] != null ? (json['rate'] as num).toDouble() : 0.0,
      count: json['count'] ?? 0,
    );
  }
}
