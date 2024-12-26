class ProductResponse {
  final int? id;
  final String? title;
  final double? price;
  final String? description;
  final String? category;
  final String? image;
  final Rating? rating;

  /// Constructor for [ProductResponse].
  const ProductResponse({
    this.id,
    this.title,
    this.price,
    this.description,
    this.category,
    this.image,
    this.rating,
  });

  /// Factory constructor for creating a [ProductResponse] instance from JSON.
  factory ProductResponse.fromJson(Map<String, dynamic> json) {
    return ProductResponse(
      id: json['id'] as int?,
      title: json['title'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      description: json['description'] as String?,
      category: json['category'] as String?,
      image: json['image'] as String?,
      rating: json['rating'] != null ? Rating.fromJson(json['rating']) : null,
    );
  }

  /// Method to convert a [ProductResponse] instance to JSON.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'price': price,
      'description': description,
      'category': category,
      'image': image,
      'rating': rating?.toJson(),
    };
  }

  @override
  String toString() {
    return 'ProductResponse(id: $id, title: $title, price: $price, description: $description, '
        'category: $category, image: $image, rating: $rating)';
  }
}

class Rating {
  final double? rate;
  final int? count;

  /// Constructor for [Rating].
  const Rating({
    this.rate,
    this.count,
  });

  /// Factory constructor for creating a [Rating] instance from JSON.
  factory Rating.fromJson(Map<String, dynamic> json) {
    return Rating(
      rate: (json['rate'] as num?)?.toDouble(),
      count: json['count'] as int?,
    );
  }

  /// Method to convert a [Rating] instance to JSON.
  Map<String, dynamic> toJson() {
    return {
      'rate': rate,
      'count': count,
    };
  }

  @override
  String toString() {
    return 'Rating(rate: $rate, count: $count)';
  }
}
