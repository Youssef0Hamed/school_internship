class UriConstants {
  static const String baseUrl = "https://restaurantreservationbackend-production.up.railway.app";

  static String getReviews(int restaurantId) => "$baseUrl/restaurants/$restaurantId/reviews";

  static String addReview(int restaurantId) => "$baseUrl/restaurants/$restaurantId/reviews";
}