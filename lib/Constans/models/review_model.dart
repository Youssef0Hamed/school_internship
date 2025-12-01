class Review {
  final String id;
  final String userName;
  final String userImage;
  final double rating;
  final String reviewText;
  final DateTime createdAt;

  Review({
    required this.id,
    required this.userName,
    required this.userImage,
    required this.rating,
    required this.reviewText,
    required this.createdAt,
  });

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      id: json['id'] ?? '',
      userName: json['userName'] ?? '',
      userImage: json['userImage'] ?? '',
      rating: (json['rating'] ?? 0).toDouble(),
      reviewText: json['reviewText'] ?? '',
      createdAt: DateTime.parse(json['createdAt'] ?? DateTime.now().toIso8601String()),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userName': userName,
      'userImage': userImage,
      'rating': rating,
      'reviewText': reviewText,
      'createdAt': createdAt.toIso8601String(),
    };
  }
}