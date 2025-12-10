import 'package:intershipflutter/Constans/models/home%20models/cuisine_model.dart';
import 'package:intershipflutter/Constans/models/home%20models/table_model.dart';
import 'package:intershipflutter/Constans/models/restaurant%20detail%20models/menu_item_model.dart';

class RestaurantModel {
  final int id;
  final String name;
  final String description;
  final String address;
  final String city;
  final String phone;
  final String email;
  final double rating;
  final int reviewCount;
  final String openTime;
  final String closeTime;
  final CuisineModel cuisine;
  final List<TableModel> tables;
  final List<MenuItem> menu;
  final List<String>? images;

  bool isFavorite; // local only

  RestaurantModel({
    required this.id,
    required this.name,
    required this.description,
    required this.address,
    required this.city,
    required this.phone,
    required this.email,
    required this.rating,
    required this.reviewCount,
    required this.openTime,
    required this.closeTime,
    required this.cuisine,
    required this.tables,
    required this.menu,
    this.isFavorite = false,
    this.images,
  });

  factory RestaurantModel.fromJson(Map<String, dynamic> json) {
    return RestaurantModel(
      id: json['id'],
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      address: json['address'] ?? '',
      city: json['city'] ?? '',
      phone: json['phone'] ?? '',
      email: json['email'] ?? '',
      rating: (json['rating'] ?? 0).toDouble(),
      reviewCount: json['review_count'] ?? 0,
      openTime: json['open_time'] ?? '',
      closeTime: json['close_time'] ?? '',
      cuisine: CuisineModel.fromJson(json['cuisine'] ?? {}),
      tables: (json['tables'] as List? ?? [])
          .map((e) => TableModel.fromJson(e))
          .toList(),
      menu: (json['menu'] as List? ?? [])
          .map((e) => MenuItem.fromJson(e))
          .toList(),
      images: (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );
  }
}