class ProductByCategoryModel {
  final int id;
  final String title;
  final String description;
  final String category;
  final double price;
  final double discountPercentage;
  final double rating;
  final int stock;
  final List<String> tags;
  final String brand;
  final String sku;
  final int weight;
  final Dimensions dimensions;
  final String warrantyInformation;
  final String shippingInformation;
  final String availabilityStatus;
  final List<Review> reviews;
  final String returnPolicy;
  final int minimumOrderQuantity;
  final Meta meta;
  final List<String> images;
  final String thumbnail;

  ProductByCategoryModel({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.price,
    required this.discountPercentage,
    required this.rating,
    required this.stock,
    required this.tags,
    required this.brand,
    required this.sku,
    required this.weight,
    required this.dimensions,
    required this.warrantyInformation,
    required this.shippingInformation,
    required this.availabilityStatus,
    required this.reviews,
    required this.returnPolicy,
    required this.minimumOrderQuantity,
    required this.meta,
    required this.images,
    required this.thumbnail,
  });

  factory ProductByCategoryModel.fromJson(Map<String, dynamic> json) {
    return ProductByCategoryModel(
      id: json['id'],
      title: json['title'] ?? "No Title",
      description: json['description'] ?? "No Description",
      category: json['category'] ?? "No Category",
      price: (json['price'] as num).toDouble(),
      discountPercentage: (json['discountPercentage'] as num).toDouble(),
      rating: (json['rating'] as num).toDouble(),
      stock: json['stock'] ?? 0,
      tags: List<String>.from(json['tags'] ?? []),
      brand: json['brand'] ?? "No Brand",
      sku: json['sku'] ?? "No SKU",
      weight: json['weight'] ?? 0,
      dimensions: Dimensions.fromJson(json['dimensions']),
      warrantyInformation: json['warrantyInformation'] ?? "No Warranty Info",
      shippingInformation: json['shippingInformation'] ?? "No Shipping Info",
      availabilityStatus: json['availabilityStatus'] ?? "Unknown",
      reviews: (json['reviews'] as List<dynamic>).map((review) => Review.fromJson(review)).toList(),
      returnPolicy: json['returnPolicy'] ?? "No Return Policy",
      minimumOrderQuantity: json['minimumOrderQuantity'] ?? 0,
      meta: Meta.fromJson(json['meta']),
      images: List<String>.from(json['images'] ?? []),
      thumbnail: json['thumbnail'] ?? "",
    );
  }
}

class Dimensions {
  final double width;
  final double height;
  final double depth;

  Dimensions({
    required this.width,
    required this.height,
    required this.depth,
  });

  factory Dimensions.fromJson(Map<String, dynamic> json) {
    return Dimensions(
      width: (json['width'] as num).toDouble(),
      height: (json['height'] as num).toDouble(),
      depth: (json['depth'] as num).toDouble(),
    );
  }
}

class Review {
  final double rating;
  final String comment;
  final String date;
  final String reviewerName;
  final String reviewerEmail;

  Review({
    required this.rating,
    required this.comment,
    required this.date,
    required this.reviewerName,
    required this.reviewerEmail,
  });

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      rating: (json['rating'] as num).toDouble(),
      comment: json['comment'] ?? "No Comment",
      date: json['date'] ?? "",
      reviewerName: json['reviewerName'] ?? "Anonymous",
      reviewerEmail: json['reviewerEmail'] ?? "",
    );
  }
}

class Meta {
  final String createdAt;
  final String updatedAt;
  final String barcode;
  final String qrCode;

  Meta({
    required this.createdAt,
    required this.updatedAt,
    required this.barcode,
    required this.qrCode,
  });

  factory Meta.fromJson(Map<String, dynamic> json) {
    return Meta(
      createdAt: json['createdAt'] ?? "",
      updatedAt: json['updatedAt'] ?? "",
      barcode: json['barcode'] ?? "",
      qrCode: json['qrCode'] ?? "",
    );
  }
}
