import 'package:flutter/material.dart';

class OfferModel {
  final String id, title, subtitle, discount, buttonText;
  OfferModel({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.discount,
    required this.buttonText,
  });
}

class OfferProvider with ChangeNotifier {
  List<OfferModel> offers = [
    OfferModel(
      id: '1',
      title: 'Weekend Offers',
      subtitle: 'Get Special Offer',
      discount: 'Up to 30%',
      buttonText: 'Book Now',
    ),
    OfferModel(
      id: '2',
      title: 'Weekday Specials',
      subtitle: 'Enjoy Great Deals',
      discount: 'Up to 25%',
      buttonText: 'Book Now',
    ),
    OfferModel(
      id: '3',
      title: 'Weekday Specials',
      subtitle: 'Enjoy Great Deals',
      discount: 'Up to 115%',
      buttonText: 'Book Now',
    ),
  ];
}