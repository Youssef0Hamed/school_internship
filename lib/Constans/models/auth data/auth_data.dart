class AuthData {
  String phoneNumber;
  String verificationCode;
  bool isRegistered;

  AuthData({
    this.phoneNumber = '',
    this.verificationCode = '',
    this.isRegistered = false,
  });

  @override
  String toString() {
    return 'AuthData(phoneNumber: $phoneNumber, verificationCode: $verificationCode, isRegistered: $isRegistered)';
  }
}