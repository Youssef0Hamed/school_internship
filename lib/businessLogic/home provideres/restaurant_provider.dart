import 'package:flutter/material.dart';


class RestaurantModel {
  final String id;
  final String name;
  final String image;
  final double rating;
  final String location;
  final List<String> amenities;
  bool isFavorite;

  RestaurantModel({
    required this.id,
    required this.name,
    required this.image,
    required this.rating,
    required this.location,
    required this.amenities,
    this.isFavorite = false,
  });
}


class RestaurantProvider with ChangeNotifier {
  List<RestaurantModel> restaurants = [
    RestaurantModel(
      id: '1',
      name: 'Tacos',
      image:
          'https://images.unsplash.com/photo-1552566626-52f8b828add9?w=500&h=400&fit=crop',
      rating: 4.3,
      location: '1/1 norway london',
      amenities: ['Live music', 'WiFi'],
    ),
    RestaurantModel(
      id: '2',
      name: 'Pizza Palace',
      image:
          'https://images.unsplash.com/photo-1565299585323-38d6b0865b47?w=500&h=400&fit=crop',
      rating: 4.7,
      location: 'oxford street',
      amenities: ['WiFi'],
    ),
  ];
}