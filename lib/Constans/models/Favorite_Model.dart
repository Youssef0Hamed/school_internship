class FavouriteCardModel {
  final String imageUrl;
  final String title;
  final double rate;
  final bool isFavourite;
  final int discount;
  final int restaurantId;

  FavouriteCardModel({
    required this.imageUrl,
    required this.title,
    required this.rate,
    required this.isFavourite,
    required this.discount,
    required this.restaurantId,
  });

  factory FavouriteCardModel.fromRestaurant(Restaurant restaurant) {
    return FavouriteCardModel(
      imageUrl: restaurant.imageUrl,
      title: restaurant.name,
      rate: restaurant.rating,
      isFavourite: restaurant.isFavorite,
      discount: int.tryParse(
            restaurant.discount.replaceAll('% off', ''),
          ) ??
          0,
      restaurantId: restaurant.id,
    );
  }
}