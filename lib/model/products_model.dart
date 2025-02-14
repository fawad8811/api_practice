class ProductModel {
  final int id;
  final String title;
  final String? description;
  final String? category;
  final double price;
  final double? discountPercentage;
  final double rating;
  final int stock;
  final String? brand;
  final List<String>? images;
  final String? thumbnail;

  ProductModel({
    required this.id,
    required this.title,
    this.description,
    this.category,
    required this.price,
    this.discountPercentage,
    required this.rating,
    required this.stock,
    this.brand,
    this.images,
    this.thumbnail,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      title: json['title'] ?? 'No Title', // Default if null
      description: json['description'] ?? 'No Description',
      category: json['category'] ?? 'Unknown',
      price: (json['price'] as num).toDouble(),
      discountPercentage: (json['discountPercentage'] as num?)?.toDouble(),
      rating: (json['rating'] as num).toDouble(),
      stock: json['stock'] ?? 0,
      brand: json['brand'] ?? 'No Brand',
      images: json['images'] != null ? List<String>.from(json['images']) : [], // Default empty list
      thumbnail: json['thumbnail'] ?? 'https://via.placeholder.com/150', // Default image if null
    );
  }
}
