import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intershipflutter/Constans/models/restaurant%20detail%20models/review_model.dart';
import 'package:intershipflutter/services/API_URI.dart';


class ReviewApi {
  // Fetch reviews for a restaurant
  static Future<List<Review>> fetchReviews(int restaurantId) async {
    final response = await http.get(Uri.parse(UriConstants.getReviews(restaurantId)));

    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body);
      return data.map((json) => Review.fromJson(json)).toList();
    } else {
      throw Exception("Failed to load reviews");
    }
  }

  // Add a review
  static Future<Review> addReview(Review review) async {
    final response = await http.post(
      Uri.parse(UriConstants.addReview(review.restaurantId)),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(review.toJson()),
    );

    if (response.statusCode == 201 || response.statusCode == 200) {
      return Review.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to add review");
    }
  }
}