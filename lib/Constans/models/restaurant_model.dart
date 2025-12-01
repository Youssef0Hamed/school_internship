class RestaurantModel {
  final String id;
  final String name;
  final String cuisine;
  final String address;
  final String phone;
  final String email;
  final String openingHours;
  final double rating;
  final int reviewCount;
  final String discount;
  final String imageUrl;
  final String about;
  final List<String> socialMedia;
  final String location;
  final List<String> amenities;
  bool isFavorite;

  RestaurantModel({
    required this.id,
    required this.name,
    required this.cuisine,
    required this.address,
    required this.phone,
    required this.email,
    required this.openingHours,
    required this.rating,
    required this.reviewCount,
    required this.discount,
    required this.imageUrl,
    required this.about,
    required this.socialMedia,
    required this.location,
    required this.amenities,
    this.isFavorite = false,
  });

  factory RestaurantModel.fromJson(Map<String, dynamic> json) {
    return RestaurantModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      cuisine: json['cuisine'] ?? '',
      address: json['address'] ?? '',
      phone: json['phone'] ?? '',
      email: json['email'] ?? '',
      openingHours: json['openingHours'] ?? '',
      rating: (json['rating'] ?? 0).toDouble(),
      reviewCount: json['reviewCount'] ?? 0,
      discount: json['discount'] ?? '',
      imageUrl: json['imageUrl'] ?? '',
      about: json['about'] ?? '',
      socialMedia: List<String>.from(json['socialMedia'] ?? []),
      location: json['location'] ?? '',
      amenities: List<String>.from(json['amenities'] ?? []),
      isFavorite: json['isFavorite'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'cuisine': cuisine,
      'address': address,
      'phone': phone,
      'email': email,
      'openingHours': openingHours,
      'rating': rating,
      'reviewCount': reviewCount,
      'discount': discount,
      'imageUrl': imageUrl,
      'about': about,
      'socialMedia': socialMedia,
      'location': location,
      'amenities': amenities,
      'isFavorite': isFavorite,
    };
  }
}