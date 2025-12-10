import 'package:flutter/material.dart';
import 'package:intershipflutter/Constans/models/restaurant%20detail%20models/restaurant_model.dart';
import 'package:intershipflutter/Constans/models/restaurant%20detail%20models/review_model.dart';
import 'package:intershipflutter/services/restaurant%20api/restaurant_api.dart';
import 'package:intershipflutter/services/review%20api/review_api.dart';

class RestaurantProvider with ChangeNotifier {
  List<RestaurantModel> restaurants = [];
  Map<int, List<Review>> restaurantReviews = {}; // key = restaurantId

  bool isLoading = false;
  String? error;

  RestaurantModel? selectedRestaurant;

  // -------------------
  // Fetch all restaurants
  // -------------------
  Future<void> fetchAllRestaurants() async {
    try {
      isLoading = true;
      notifyListeners();

      restaurants = await RestaurantApi.getRestaurants();

      isLoading = false;
      notifyListeners();
    } catch (e) {
      error = e.toString();
      isLoading = false;
      notifyListeners();
    }
  }

  // -------------------
  // Fetch single restaurant details
  // -------------------
  Future<void> fetchRestaurantById(int id) async {
    try {
      isLoading = true;
      notifyListeners();

      // Fetch restaurant from existing list or API
      selectedRestaurant =
          restaurants.firstWhere((r) => r.id == id, orElse: () => restaurants.first);

      // Fetch reviews
      restaurantReviews[id] = await ReviewApi.fetchReviews(id);

      isLoading = false;
      notifyListeners();
    } catch (e) {
      error = e.toString();
      isLoading = false;
      notifyListeners();
    }
  }

  // -------------------
  // Add review
  // -------------------
  Future<void> addReview(Review review) async {
    try {
      final newReview = await ReviewApi.addReview(review);
      if (restaurantReviews[review.restaurantId] == null) {
        restaurantReviews[review.restaurantId] = [];
      }
      restaurantReviews[review.restaurantId]!.insert(0, newReview);
      notifyListeners();
    } catch (e) {
      error = e.toString();
      notifyListeners();
    }
  }

  List<Review> getReviewsForRestaurant(int restaurantId) {
    return restaurantReviews[restaurantId] ?? [];
  }

  // -------------------
  // Add new restaurant (POST)
  // -------------------
  Future<void> addRestaurant(RestaurantModel restaurant) async {
    try {
      isLoading = true;
      notifyListeners();

      final newRestaurant = await RestaurantApi.addRestaurant(restaurant);
      restaurants.insert(0, newRestaurant); // add to list
      isLoading = false;
      notifyListeners();
    } catch (e) {
      error = e.toString();
      isLoading = false;
      notifyListeners();
    }
  }

  // -------------------
  // Toggle favorite status of a restaurant
  // -------------------
  void toggleFavorite(String restaurantId) {
    final index =
        restaurants.indexWhere((restaurant) => restaurant.id == restaurantId);
    if (index != -1) {
      restaurants[index].isFavorite = !restaurants[index].isFavorite;
      notifyListeners();
    }
  }

  // -------------------
  // Reset error/loading state
  // -------------------
  void resetState() {
    error = null;
    isLoading = false;
    notifyListeners();
  }
}