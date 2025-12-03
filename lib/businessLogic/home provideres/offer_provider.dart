import 'package:flutter/material.dart';
import 'package:intershipflutter/Constans/models/home%20models/offer_model.dart';


class OfferProvider with ChangeNotifier {
  List<OfferModel> offers = [
    OfferModel(
      id: '1',
      title: 'Weekend Offers',
      subtitle: 'Get Special Offer',
      discount: '30',
      buttonText: 'Book Now',
    ),
    OfferModel(
      id: '2',
      title: 'Weekday Specials',
      subtitle: 'Enjoy Great Deals',
      discount: '25',
      buttonText: 'Book Now',
    ),
    OfferModel(
      id: '3',
      title: 'Weekday Specials',
      subtitle: 'Enjoy Great Deals',
      discount: '115',
      buttonText: 'Book Now',
    ),
  ];
}