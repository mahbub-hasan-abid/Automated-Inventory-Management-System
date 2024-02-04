class ProductModel {
  String productName;
  String price;
  String category;
  String description;
  String id;

  ProductModel({
    required this.productName,
    required this.price,
    required this.category,
    required this.description,
    required this.id,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      productName: json['name'] as String,
      price: json['price'] as String,
      category: json['category'] as String,
      description: json['description'] as String,
      id: json['id'] as String,
    );
  }
}
