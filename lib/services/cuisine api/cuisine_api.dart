import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intershipflutter/Constans/models/home%20models/cuisine_model.dart';

class CuisineApi {
  static const String baseUrl =
      "https://restaurantreservationbackend-production.up.railway.app";

  // -------------------
  // Create new cuisine
  // -------------------
  static Future<CuisineModel> createCuisine(CuisineModel cuisine) async {
    final response = await http.post(
      Uri.parse("$baseUrl/cuisines/create_cuisine"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(cuisine.toJson()),
    );

    if (response.statusCode == 201 || response.statusCode == 200) {
      return CuisineModel.fromJson(jsonDecode(response.body));
    } else {
      print('Error creating cuisine: ${response.body}');
      throw Exception("Failed to create cuisine");
    }
  }

  // -------------------
  // Get all cuisines
  // -------------------
  static Future<List<CuisineModel>> getCuisines() async {
    final response = await http.get(Uri.parse("$baseUrl/cuisines/"));

    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body);
      return data.map((json) => CuisineModel.fromJson(json)).toList();
    } else {
      print('Error fetching cuisines: ${response.body}');
      throw Exception("Failed to load cuisines");
    }
  }
}