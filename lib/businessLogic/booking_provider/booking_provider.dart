import 'package:flutter/material.dart';
import 'package:intershipflutter/api/booking%20api/booking_api.dart';


class BookingProvider extends ChangeNotifier {
  String? name;
  String? email;
  String? phone;
  String? occasion;

  DateTime? selectedDay;
  int? hour;
  int? minute;
  bool? isPM;
  int? guestCount;
  String? seating;

  void setDummyData() {
    selectedDay ??= DateTime.now();
    hour ??= 12;
    minute ??= 0;
    isPM ??= true;
    guestCount ??= 1;
    seating ??= 'indoor';
  }

  void setUserDetails({
    required String name,
    required String email,
    required String phone,
    required String occasion,
  }) {
    this.name = name;
    this.email = email;
    this.phone = phone;
    this.occasion = occasion;
    notifyListeners();
  }

  void setBookingData({
    required String day,
    required String hour,
    required String minute,
    required bool isPM,
    required int guestCount,
    required String seating,
  }) {
    selectedDay = DateTime.parse(day);
    this.hour = int.tryParse(hour);
    this.minute = int.tryParse(minute);
    this.isPM = isPM;
    this.guestCount = guestCount;
    this.seating = seating;
    notifyListeners();
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name ?? "",
      "email": email ?? "",
      "phone": phone ?? "",
      "occasion": occasion ?? "",
      "booking": {
        "day": selectedDay?.toIso8601String() ?? "",
        "hour": hour ?? 0,
        "minute": minute ?? 0,
        "isPM": isPM ?? true,
        "guestCount": guestCount ?? 1,
        "seating": seating ?? "indoor",
      }
    };
  }

  // Future<bool> sendBooking() async {
  //   final result = await BookingAPI.sendBooking(toJson());
  //   return result;
  // }
}