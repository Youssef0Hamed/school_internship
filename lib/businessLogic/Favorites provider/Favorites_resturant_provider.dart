import 'package:flutter/material.dart';
import 'package:intershipflutter/Constans/models/favorite_model.dart';
import 'package:intershipflutter/services/%20favorite%20api/%20favorite_api.dart';

class FavoriteProvider with ChangeNotifier {
  Map<int, bool> favorites = {}; // restaurantId : isFavorite
  bool isLoading = false;
  String? error;

  // ------------------------------------------------------------
  // GET FAVORITES FROM BACKEND
  // ------------------------------------------------------------
  Future<void> loadFavorites() async {
    try {
      isLoading = true;
      notifyListeners();

      List<int> ids = await FavoriteApi.getFavorites();

      favorites = {
        for (var id in ids) id: true,
      };

      isLoading = false;
      notifyListeners();
    } catch (e) {
      error = e.toString();
      isLoading = false;
      notifyListeners();
    }
  }

  // ------------------------------------------------------------
  // POST - TOGGLE FAVORITE
  // ------------------------------------------------------------
  Future<void> toggleFavorite(int restaurantId) async {
    try {
      isLoading = true;
      notifyListeners();

      FavoriteModel result = await FavoriteApi.toggleFavorite(restaurantId);

      favorites[result.restaurantId] = result.isFavorite;

      isLoading = false;
      notifyListeners();
    } catch (e) {
      error = e.toString();
      isLoading = false;
      notifyListeners();
    }
  }

  // ------------------------------------------------------------
  // DELETE FAVORITE
  // ------------------------------------------------------------
  Future<void> removeFavorite(int restaurantId) async {
    try {
      isLoading = true;
      notifyListeners();

      bool success = await FavoriteApi.deleteFavorite(restaurantId);

      if (success) {
        favorites[restaurantId] = false;
      }

      isLoading = false;
      notifyListeners();
    } catch (e) {
      error = e.toString();
      isLoading = false;
      notifyListeners();
    }
  }

  // ------------------------------------------------------------
  // CHECK IF FAVORITE
  // ------------------------------------------------------------
  bool isRestaurantFavorite(int restaurantId) {
    return favorites[restaurantId] ?? false;
  }
}