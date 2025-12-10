import 'package:flutter/material.dart';
import 'package:intershipflutter/Constans/models/home%20models/cuisine_model.dart';
import 'package:intershipflutter/services/cuisine%20api/cuisine_api.dart';

class CuisineProvider with ChangeNotifier {
  List<CuisineModel> cuisines = [];
  bool isLoading = false;
  String? error;

selectCuisine(String cuisineId) {
    for (var cuisine in cuisines) {
      cuisine.isActive = cuisine.id == cuisineId;
    }
    notifyListeners();
  }


  // -------------------
  // Fetch all cuisines
  // -------------------
  Future<void> fetchCuisines() async {
    try {
      isLoading = true;
      notifyListeners();

      cuisines = await CuisineApi.getCuisines();

      isLoading = false;
      notifyListeners();
    } catch (e) {
      error = e.toString();
      isLoading = false;
      notifyListeners();
    }
  }

  // -------------------
  // Add new cuisine
  // -------------------
  Future<void> addCuisine(CuisineModel cuisine) async {
    try {
      isLoading = true;
      notifyListeners();

      final newCuisine = await CuisineApi.createCuisine(cuisine);
      cuisines.insert(0, newCuisine);

      isLoading = false;
      notifyListeners();
    } catch (e) {
      error = e.toString();
      isLoading = false;
      notifyListeners();
    }
  }

  // -------------------
  // Reset provider state
  // -------------------
  void reset() {
    error = null;
    isLoading = false;
    notifyListeners();
  }
}