import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intershipflutter/Constans/models/restaurant%20detail%20models/restaurant_model.dart';

class RestaurantApi {
  static const String baseUrl =
      "https://restaurantreservationbackend-production.up.railway.app";

  // -------------------
  // Get all restaurants
  // -------------------
  static Future<List<RestaurantModel>> getRestaurants() async {
    final response = await http.get(Uri.parse("$baseUrl/restaurants/"));

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);
      return data.map((json) => RestaurantModel.fromJson(json)).toList();
    } else {
      print('Error fetching restaurants: ${response.body}');
      throw Exception("Failed to load restaurants");
    }
  }

  // -------------------
  // Get single restaurant by ID
  // -------------------
  static Future<RestaurantModel> getRestaurant(int id) async {
    final response = await http.get(Uri.parse("$baseUrl/restaurants/$id"));

    if (response.statusCode == 200) {
      return RestaurantModel.fromJson(jsonDecode(response.body));
    } else {
      print('Error fetching restaurant $id: ${response.body}');
      throw Exception("Failed to load restaurant");
    }
  }

  // -------------------
  // Add new restaurant (POST)
  // -------------------
  static Future<RestaurantModel> addRestaurant(RestaurantModel restaurant) async {
    final response = await http.post(
      Uri.parse("$baseUrl/restaurants/"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "name": restaurant.name,
        "description": restaurant.description,
        "address": restaurant.address,
        "phone": restaurant.phone,
        "open_time": restaurant.openTime,
        "close_time": restaurant.closeTime,
        "cuisine_id": restaurant.cuisine,
        "email": restaurant.email,
      }),
    );

    if (response.statusCode == 201 || response.statusCode == 200) {
      return RestaurantModel.fromJson(jsonDecode(response.body));
    } else {
      print('Error adding restaurant: ${response.body}');
      throw Exception("Failed to add restaurant");
    }
  }

  // -------------------
  // Update existing restaurant (PUT)
  // -------------------
  static Future<RestaurantModel> updateRestaurant(RestaurantModel restaurant) async {
    final response = await http.put(
      Uri.parse("$baseUrl/restaurants/${restaurant.id}"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "name": restaurant.name,
        "description": restaurant.description,
        "address": restaurant.address,
        "phone": restaurant.phone,
        "open_time": restaurant.openTime,
        "close_time": restaurant.closeTime,
        "cuisine_id": restaurant.cuisine,
        "email": restaurant.email,
      }),
    );

    if (response.statusCode == 200) {
      return RestaurantModel.fromJson(jsonDecode(response.body));
    } else {
      print('Error updating restaurant: ${response.body}');
      throw Exception("Failed to update restaurant");
    }
  }
// -------------------
// Delete restaurant by ID
// -------------------
static Future<void> deleteRestaurant(int id) async {
  final response = await http.delete(
    Uri.parse("$baseUrl/restaurants/$id"),
    headers: {"accept": "application/json"},
  );

  if (response.statusCode != 200) {
    print('Error deleting restaurant: ${response.body}');
    throw Exception("Failed to delete restaurant");
  }
}
}