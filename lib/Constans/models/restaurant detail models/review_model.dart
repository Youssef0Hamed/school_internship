class Review {
  final int id;
  final int restaurantId;
  final String userName;
  final String userImage;
  final double rating;
  final String reviewText;
  final DateTime createdAt;

  Review({
    required this.id,
    required this.restaurantId,
    required this.userName,
    required this.userImage,
    required this.rating,
    required this.reviewText,
    required this.createdAt,
  });

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      id: json['id'] ?? 0,
      restaurantId: json['restaurant_id'] ?? 0,
      userName: json['userName'] ?? 'Anonymous',
      userImage: json['userImage'] ?? 'https://ui-avatars.com/api/?name=User',
      rating: (json['rating'] ?? 0).toDouble(),
      reviewText: json['reviewText'] ?? '',
      createdAt: DateTime.parse(json['createdAt'] ?? DateTime.now().toString()),
    );
  }

  Map<String, dynamic> toJson() => {
        "restaurant_id": restaurantId,
        "userName": userName,
        "userImage": userImage,
        "rating": rating,
        "reviewText": reviewText,
        "createdAt": createdAt.toIso8601String(),
      };
}