import 'package:flutter/material.dart';
import 'package:intershipflutter/Constans/models/user_model.dart';


class UserProvider extends ChangeNotifier {
  late User _user;
  bool _isLoading = false;
  String? _errorMessage;

  // Getters
  User get user => _user;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  UserProvider() {
    _initializeDummyData();
  }

  // Initialize with dummy data
  void _initializeDummyData() {
    _user = User(
      id: '1',
      fullName: 'Lionel Messi',
      phoneNumber: '0111111111',
      email: 'leomessi@email.com',
      profileImageUrl: 'https://via.placeholder.com/150',
      createdAt: DateTime.now().subtract(const Duration(days: 365)),
      updatedAt: DateTime.now(),
    );
  }

  // Update user profile
  Future<void> updateUserProfile({
    required String fullName,
    required String phoneNumber,
    required String email,
  }) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      // Simulate API call delay
      await Future.delayed(const Duration(seconds: 1));

      _user = _user.copyWith(
        fullName: fullName,
        phoneNumber: phoneNumber,
        email: email,
        updatedAt: DateTime.now(),
      );

      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _errorMessage = 'Failed to update profile: $e';
      _isLoading = false;
      notifyListeners();
    }
  }

  // Update phone number only
  Future<void> updatePhoneNumber(String phoneNumber) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      await Future.delayed(const Duration(seconds: 1));

      _user = _user.copyWith(
        phoneNumber: phoneNumber,
        updatedAt: DateTime.now(),
      );

      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _errorMessage = 'Failed to update phone number: $e';
      _isLoading = false;
      notifyListeners();
    }
  }

  // Reset to dummy data
  void resetToDummyData() {
    _initializeDummyData();
    _errorMessage = null;
    _isLoading = false;
    notifyListeners();
  }

  // Clear error message
  void clearError() {
    _errorMessage = null;
    notifyListeners();
  }
}