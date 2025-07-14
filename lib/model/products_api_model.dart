
class ProductsApiModel {
  int id;
  String title;
  String description;
  String category;
  double price;
  double discountPercentage;
  double rating;
  double stock;
  List<String> tags;
  String brand;
  String sku;
  int weight;
  Dimension dimensions;
  String warrantyInformation;
  String shippingInformation;
  String availabilityStatus;
  List<Review> reviews;
  String returnPolicy;
  int minimumOrderQuantity;
  Meta meta;
  List<String> images;
  String thumbnail;

  ProductsApiModel({
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

  // Convert Product to Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'category': category,
      'price': price,
      'discountPercentage': discountPercentage,
      'rating': rating,
      'stock': stock,
      'tags': tags,
      'brand': brand,
      'sku': sku,
      'weight': weight,
      'dimensions': dimensions.toMap(),
      'warrantyInformation': warrantyInformation,
      'shippingInformation': shippingInformation,
      'availabilityStatus': availabilityStatus,
      'reviews': reviews.map((review) => review.toMap()).toList(),
      'returnPolicy': returnPolicy,
      'minimumOrderQuantity': minimumOrderQuantity,
      'meta': meta.toMap(),
      'images': images,
      'thumbnail': thumbnail,
    };
  }

  // Convert Map to Product
  factory ProductsApiModel.fromJson(Map<String, dynamic> json) {
    return ProductsApiModel(
      id: int.parse(json['id'].toString()),
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      category: json['category'] ?? '',
      price: double.parse(json['price'].toString()),
      discountPercentage: double.parse(json['discountPercentage'].toString()),
      rating: double.parse(json['rating'].toString()),
      stock: double.parse(json['stock'].toString()),
      tags: List<String>.from(json['tags'] ?? []),
      brand: json['brand'] ?? '',
      sku: json['sku'] ?? '',
      weight: int.parse(json['weight'].toString()),
      dimensions: Dimension.fromJson(json['dimensions'] ?? {}),
      warrantyInformation: json['warrantyInformation'] ?? '',
      shippingInformation: json['shippingInformation'] ?? '',
      availabilityStatus: json['availabilityStatus'] ?? '',
      reviews: (json['reviews'] as List?)?.map((reviewJson) => Review.fromJson(reviewJson)).toList() ?? [],
      returnPolicy: json['returnPolicy'] ?? '',
      minimumOrderQuantity: int.parse(json['minimumOrderQuantity'].toString()),
      meta: Meta.fromJson(json['meta'] ?? {}),
      images: List<String>.from(json['images'] ?? []),
      thumbnail: json['thumbnail'] ?? '',
    );
  }

  // Convert JSON string into list of Products
  static List<ProductsApiModel> fromJsonList(Map<String, dynamic> json) {
    final List<dynamic> jsonList = json['products'] ?? []; // Get the products list directly from the response
    return jsonList.map((json) => ProductsApiModel.fromJson(json)).toList();
  }

}

// Review class for product reviews
class Review {
  double rating;
  String comment;
  DateTime date;
  String reviewerName;
  String reviewerEmail;

  Review({
    required this.rating,
    required this.comment,
    required this.date,
    required this.reviewerName,
    required this.reviewerEmail,
  });

  // Convert Review to Map
  Map<String, dynamic> toMap() {
    return {
      'rating': rating,
      'comment': comment,
      'date': date.toIso8601String(),
      'reviewerName': reviewerName,
      'reviewerEmail': reviewerEmail,
    };
  }

  // Convert Map to Review
  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      rating: double.parse(json['rating'].toString()),
      comment: json['comment'] ?? '',
      date: DateTime.parse(json['date'] ?? DateTime.now().toString()),
      reviewerName: json['reviewerName'] ?? '',
      reviewerEmail: json['reviewerEmail'] ?? '',
    );
  }
}

// Meta class for product metadata
class Meta {
  DateTime createdAt;
  DateTime updatedAt;
  String barcode;
  String qrCode;

  Meta({
    required this.createdAt,
    required this.updatedAt,
    required this.barcode,
    required this.qrCode,
  });

  // Convert Meta to Map
  Map<String, dynamic> toMap() {
    return {
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'barcode': barcode,
      'qrCode': qrCode,
    };
  }

  // Convert Map to Meta
  factory Meta.fromJson(Map<String, dynamic> json) {
    return Meta(
      createdAt: DateTime.parse(json['createdAt'] ?? DateTime.now().toString()),
      updatedAt: DateTime.parse(json['updatedAt'] ?? DateTime.now().toString()),
      barcode: json['barcode'] ?? '',
      qrCode: json['qrCode'] ?? '',
    );
  }
}

// Dimension class for product dimensions
class Dimension {
  double width;
  double height;
  double depth;

  Dimension({
    required this.width,
    required this.height,
    required this.depth,
  });

  // Convert Dimension to Map
  Map<String, dynamic> toMap() {
    return {
      'width': width,
      'height': height,
      'depth': depth,
    };
  }

  // Convert Map to Dimension
  factory Dimension.fromJson(Map<String, dynamic> json) {
    return Dimension(
      width: double.parse(json['width'].toString()) ,
      height:  double.parse(json['height'].toString()) ,
      depth:  double.parse(json['depth'].toString()) ,
    );
  }
}
