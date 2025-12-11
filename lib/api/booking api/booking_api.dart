// import 'dart:convert';
// import 'package:http/http.dart' as http;

// class BookingAPI {
//   static const String baseUrl = 'https://your-api-endpoint.com';

//   static Future<bool> sendBooking(Map<String, dynamic> data) async {
//     final url = Uri.parse('$baseUrl/bookings');

//     try {
//       final response = await http.post(
//         url,
//         headers: {'Content-Type': 'application/json'},
//         body: jsonEncode(data),
//       );

//       if (response.statusCode == 200 || response.statusCode == 201) {
//         print("✅ Booking successful: ${response.body}");
//         return true;
//       } else {
//         print("❌ Booking failed: ${response.body}");
//         return false;
//       }
//     } catch (e) {
//       print("❌ Error sending booking: $e");
//       return false;
//     }
//   }
// }