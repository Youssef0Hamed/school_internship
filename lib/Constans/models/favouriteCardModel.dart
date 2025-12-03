class Favouritecardmodel {
  final String title;
  final double rate;
  final String imageUrl;
  bool isFavourite;
  final int discount;

  Favouritecardmodel({
    required this.title,
    required this.rate,
    required this.imageUrl,
    this.isFavourite = false,
    required this.discount,
  });
}
