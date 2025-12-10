import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intershipflutter/Constans/models/favorite_model.dart';

class FavoriteApi {
  static const String baseUrl =
      "https://restaurantreservationbackend-production.up.railway.app";

  // ------------------------------------------------------------
  // GET ALL FAVORITES
  // ------------------------------------------------------------
  static Future<List<int>> getFavorites() async {
    final response = await http.get(Uri.parse("$baseUrl/favorites"));

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);

      // API يرجع فقط قائمة IDs
      return List<int>.from(data);
    }

    throw Exception("Failed to load favorites");
  }

  // ------------------------------------------------------------
  // POST - ADD/TOGGLE FAVORITE
  // ------------------------------------------------------------
  static Future<FavoriteModel> toggleFavorite(int restaurantId) async {
    final response = await http.post(
      Uri.parse("$baseUrl/favorites/$restaurantId"),
      headers: {"accept": "application/json"},
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      return FavoriteModel.fromJson(jsonDecode(response.body));
    }

    throw Exception("Failed to toggle favorite");
  }

  // ------------------------------------------------------------
  // DELETE FAVORITE
  // ------------------------------------------------------------
  static Future<bool> deleteFavorite(int restaurantId) async {
    final response =
        await http.delete(Uri.parse("$baseUrl/favorites/$restaurantId"));

    if (response.statusCode == 200 || response.statusCode == 204) {
      return true;
    }

    throw Exception("Failed to delete favorite");
  }
}