import 'package:flutter/material.dart';
import 'package:intershipflutter/Constans/models/home%20models/cuisine_model.dart';
class CuisineProvider with ChangeNotifier {
  List<CuisineModel> cuisines = [
    CuisineModel(id: 'all', name: 'All', icon: '🥗', isActive: true),
    CuisineModel(id: 'italian', name: 'Italian', icon: '🍕'),
    CuisineModel(id: 'asian', name: 'Asian', icon: '🍜'),
    CuisineModel(id: 'vegetarian', name: 'Vegetarian', icon: '🥙'),
    CuisineModel(id: 'mexican', name: 'Mexican', icon: '🌮'),
  ];

  void selectCuisine(String id) {
    for (var c in cuisines) {
      c.isActive = c.id == id;
    }
    notifyListeners();
  }
}