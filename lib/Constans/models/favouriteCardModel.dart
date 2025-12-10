// FavouriteCardModel (null-safety friendly)
class FavouriteCardModel {
  final int restaurantId;
  final String title;
  final double rate;
  final String imageUrl;
  bool isFavourite;
  final int discount;

  FavouriteCardModel({
    required this.restaurantId,
    required this.title,
    required this.rate,
    required this.imageUrl,
    this.isFavourite = false,
    required this.discount,
  });
}
