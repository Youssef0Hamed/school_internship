class BookingModel {
  final DateTime date;
  final int hour;
  final int minute;
  final bool isPM;
  final int guestCount;
  final String seating; // indoor / outdoor
  final String name;
  final String email;
  final String phone;
  final String occasion;

  BookingModel({
    required this.date,
    required this.hour,
    required this.minute,
    required this.isPM,
    required this.guestCount,
    required this.seating,
    required this.name,
    required this.email,
    required this.phone,
    required this.occasion,
  });

  String get formattedTime {
    final h = hour.toString().padLeft(2, "0");
    final m = minute.toString().padLeft(2, "0");
    final suffix = isPM ? "PM" : "AM";
    return "$h:$m $suffix";
  }
}