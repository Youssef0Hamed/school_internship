import 'package:flutter/material.dart';
import 'package:intershipflutter/Constans/models/restaurant%20detail%20models/menu_item_model.dart';
import 'package:intershipflutter/Constans/models/restaurant%20detail%20models/restaurant_model.dart';
import 'package:intershipflutter/Constans/models/restaurant%20detail%20models/review_model.dart';

class RestaurantProvider with ChangeNotifier {
  // 🔹 List of restaurants (you can expand this later)
  List<RestaurantModel> restaurants = [
    RestaurantModel(
      id: '1',
      name: 'Tacos',
      cuisine: 'Mexican',
      address: '1.11 Norway, London',
      phone: '01222439150',
      email: 'Tacos@gmail.com',
      openingHours: '11:00 a.m - 10:00 p.m',
      rating: 4.3,
      reviewCount: 385,
      discount: '10% off',
      images: [
        'https://images.unsplash.com/photo-1552566626-52f8b828add9?w=500&h=400&fit=crop',
        'https://images.unsplash.com/photo-1552566626-52f8b828add9?w=500&h=400&fit=crop',
        'https://images.unsplash.com/photo-1552566626-52f8b828add9?w=500&h=400&fit=crop',
      ],
      about:
          'At Tacos, we believe food should do more than fill you up—it should make you feel good and create moments you remember.',
      socialMedia: ['facebook', 'instagram', 'twitter'],
      location: 'elobour',
      amenities: ['WiFi', 'Parking', 'Outdoor Seating'],
    ),
    RestaurantModel(
      id: '2',
      name: 'Tacos',
      cuisine: 'continental',
      address: '1.11 Norway, London',
      phone: '01222439150',
      email: 'Tacos@gmail.com',
      openingHours: '11:00 a.m - 10:00 p.m',
      rating: 4.3,
      reviewCount: 385,
      discount: '10% off',
      images: [
        'https://images.unsplash.com/photo-1552566626-52f8b828add9?w=500&h=400&fit=crop',
        'https://images.unsplash.com/photo-1552566626-52f8b828add9?w=500&h=400&fit=crop',
        'https://images.unsplash.com/photo-1552566626-52f8b828add9?w=500&h=400&fit=crop',
      ],
      about:
          'At Tacos, we believe food should do more than fill you up—it should make you feel good and create moments you remember.',
      socialMedia: ['facebook', 'instagram', 'twitter'],
      location: 'elobour',
      amenities: ['WiFi', 'Parking', 'Outdoor Seating'],
    ),
    RestaurantModel(
      id: '3',
      name: 'Tacos',
      cuisine: 'Mexican',
      address: '1.11 Norway, London',
      phone: '01222439150',
      email: 'Tacos@gmail.com',
      openingHours: '11:00 a.m - 10:00 p.m',
      rating: 4.3,
      reviewCount: 385,
      discount: '10% off',
      images: [
        'https://images.unsplash.com/photo-1552566626-52f8b828add9?w=500&h=400&fit=crop',
        'https://images.unsplash.com/photo-1552566626-52f8b828add9?w=500&h=400&fit=crop',
        'https://images.unsplash.com/photo-1552566626-52f8b828add9?w=500&h=400&fit=crop',
      ],
      about:
          'At Tacos, we believe food should do more than fill you up—it should make you feel good and create moments you remember.',
      socialMedia: ['facebook', 'instagram', 'twitter'],
      location: 'elobour',
      amenities: ['WiFi', 'Parking', 'Outdoor Seating'],
    ),  
  ];
  // 🔹 Reviews for the current restaurant
  List<Review> reviews = [
  Review(
    id: '1',
    userName: 'Billie',
    userImage: 'https://ui-avatars.com/api/?name=Billie',
    rating: 4.0,
    reviewText:
        'I visited Taco last week, and honestly, I was surprised in the best way...',
    createdAt: DateTime.now().subtract(const Duration(days: 7)),
  ),
  Review(
    id: '2',
    userName: 'Hamza',
    userImage: 'https://ui-avatars.com/api/?name=Hamza',
    rating: 4.0,
    reviewText: 'Warm vibes and a classy place. Highly recommended.',
    createdAt: DateTime.now().subtract(const Duration(days: 5)),
  ),
  Review(
    id: '3',
    userName: 'Sarah',
    userImage: 'https://ui-avatars.com/api/?name=Sarah',
    rating: 5.0,
    reviewText: 'Amazing food and service! Best tacos I’ve ever tried.',
    createdAt: DateTime.now().subtract(const Duration(days: 3)),
  ),
];
  // 🔹 Menu items
  List<MenuItem> menuItems = [
    MenuItem(
      id: '1',
      name: 'Carne Asada Tacos',
      description: 'Grilled marinated beef with cilantro and onions',
      price: 12.99,
      category: 'Tacos',
      imageUrl:
          'https://images.unsplash.com/photo-1565299585323-38d6b0865b47?w=300&h=300&fit=crop',
    ),
    MenuItem(
      id: '2',
      name: 'Chicken Tacos',
      description: 'Grilled chicken with lettuce, cheese, and salsa',
      price: 11.99,
      category: 'Tacos',
      imageUrl:
          'https://images.unsplash.com/photo-1565299585323-38d6b0865b47?w=300&h=300&fit=crop',
    ),
    MenuItem(
      id: '3',
      name: 'Fish Tacos',
      description: 'Crispy battered fish with cabbage slaw and lime',
      price: 13.99,
      category: 'Tacos',
      imageUrl:
          'https://images.unsplash.com/photo-1565299585323-38d6b0865b47?w=300&h=300&fit=crop',
    ),
  ];

  // 🔹 Loading and error states
  bool isLoading = false;
  String? error;
  // -------------------------------
  // Methods
  // -------------------------------

  // Add a review
  void addReview(Review review) {
    reviews.add(review);
    notifyListeners();
  }

  // Toggle favorite status of a restaurant
  void toggleFavorite(String restaurantId) {
    final index =
        restaurants.indexWhere((restaurant) => restaurant.id == restaurantId);
    if (index != -1) {
      restaurants[index].isFavorite = !restaurants[index].isFavorite;
      notifyListeners();
    }
  }

  // Refresh all data (simulate API reload)
  Future<void> refreshData() async {
    isLoading = true;
    notifyListeners();

    try {
      // Simulate a delay like fetching from API
      await Future.delayed(const Duration(seconds: 1));

      // You could fetch new data here
      // For now, we just reset the lists
      reviews = List.from(reviews);
      menuItems = List.from(menuItems);
      isLoading = false;
      notifyListeners();
    } catch (e) {
      error = 'Failed to refresh data: $e';
      isLoading = false;
      notifyListeners();
    }
  }
}