import 'package:flutter/material.dart';
import 'package:intershipflutter/Constans/models/restaurant%20detail%20models/restaurant_model.dart';
import 'package:intershipflutter/businessLogic/restaurant%20provider/restaurant_provider.dart';

class FavoritesProvider with ChangeNotifier {
  // لا ننشئ RestaurantProvider جديد هنا
  // ستستخدمونه من context عند الحاجة

  List<RestaurantModel> favorites = [];


  // تحميل المفضلات من الـ provider الموجود
  void loadFavorites(RestaurantProvider restaurantProvider) {
  favorites =
        restaurantProvider.restaurants.where((r) => r.isFavorite).toList();
    notifyListeners();
  }

  void toggleFavorite(String restaurantId, RestaurantProvider restaurantProvider) {
    final index =
        restaurantProvider.restaurants.indexWhere((r) => r.id == restaurantId);
    if (index != -1) {
      final restaurant = restaurantProvider.restaurants[index];
      restaurant.isFavorite = !restaurant.isFavorite;

      if (restaurant.isFavorite) {
      favorites.add(restaurant);
      } else {
      favorites.removeWhere((r) => r.id == restaurantId);
      }
      notifyListeners();
    }
  }

  void addFavorite(RestaurantModel restaurant, RestaurantProvider restaurantProvider) {
    final index = restaurantProvider.restaurants
        .indexWhere((r) => r.id == restaurant.id);
    if (index != -1 && !restaurantProvider.restaurants[index].isFavorite) {
      restaurantProvider.restaurants[index].isFavorite = true;
    favorites.add(restaurantProvider.restaurants[index]);
      notifyListeners();
    }
  }

  void removeFavorite(String restaurantId, RestaurantProvider restaurantProvider) {
    final index =
        restaurantProvider.restaurants.indexWhere((r) => r.id == restaurantId);
    if (index != -1 && restaurantProvider.restaurants[index].isFavorite) {
      restaurantProvider.restaurants[index].isFavorite = false;
    favorites.removeWhere((r) => r.id == restaurantId);
      notifyListeners();
    }
  }
}