import 'package:flutter/material.dart';
import 'package:intershipflutter/Constans/models/auth%20data/auth_data.dart';


class AuthProvider with ChangeNotifier {
  AuthData _authData = AuthData();

  AuthData get authData => _authData;

  // Simulate sending a code and moving to the next screen
  void setPhoneNumber(String number) {
    _authData.phoneNumber = number;
    // In a real app, this would trigger an API call to send the code
    // For this UI-only example, we'll just update the state
    notifyListeners();
  }

  // Simulate verifying the code
  bool verifyCode(String code) {
    // In a real app, this would check the code against the server
    // For this UI-only example, we'll accept any 4-digit code and simulate success
    if (code.length == 4) {
      _authData.verificationCode = code;
      notifyListeners();
      return true;
    }
    return false;
  }

  // Simulate completing the registration
  void completeRegistration() {
    _authData.isRegistered = true;
    notifyListeners();
  }

  // Reset the state for a new flow
  void reset() {
    _authData = AuthData();
    notifyListeners();
  }
}
