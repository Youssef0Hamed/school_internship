import 'package:flutter/material.dart';
import 'package:intershipflutter/Presentation/Screens/home%20screen/home_screen.dart';
import 'package:provider/provider.dart';
import 'package:intershipflutter/businessLogic/booking_provider/booking_provider.dart';
import 'package:intl/intl.dart';

class ConfirmationScreen extends StatelessWidget {
  const ConfirmationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final width = MediaQuery.of(context).size.width;

    final provider = Provider.of<BookingProvider>(context);
    final date = provider.selectedDay != null
        ? DateFormat('EEE, MMM d, yyyy').format(provider.selectedDay!)
        : 'N/A';
    final time = provider.hour != null && provider.minute != null
        ? '${provider.hour!.toString().padLeft(2, '0')}:${provider.minute!.toString().padLeft(2, '0')} ${provider.isPM! ? "PM" : "AM"}'
        : 'N/A';
    final guests = provider.guestCount ?? 0;
    final seating = provider.seating ?? 'N/A';
    final name = provider.name ?? 'N/A';
    final email = provider.email ?? 'N/A';
    final phone = provider.phone ?? 'N/A';
    final occasion = provider.occasion ?? 'N/A';

    return Scaffold(
      backgroundColor: colors.background,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.06),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  const SizedBox(height: 40),

                  // Check Icon
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: colors.primary,
                    child: const Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 50,
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Title
                  Text(
                    'Reservation Confirmed!',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      color: colors.onBackground,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 12),

                  // Subtitle
                  Text(
                    'Your table is ready! Thanks for choosing us.',
                    style: TextStyle(
                      fontSize: 14,
                      color: colors.onBackground.withOpacity(0.7),
                    ),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 30),

                  // Booking Details
                  _detailRow("Name", name, colors),
                  _detailRow("Email", email, colors),
                  _detailRow("Phone", phone, colors),
                  _detailRow("Occasion", occasion, colors),
                  _detailRow("Date", date, colors),
                  _detailRow("Time", time, colors),
                  _detailRow("Guests", guests.toString(), colors),
                  _detailRow("Seating", seating, colors),
                ],
              ),

              // Bottom Button
              Padding(
                padding: const EdgeInsets.only(bottom: 24),
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: colors.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (_) => const HomeScreen()),
                        (route) => false,
                      );
                    },
                    child: const Text(
                      'Back to home',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _detailRow(String label, String value, ColorScheme colors) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "$label:",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: colors.onBackground,
            ),
          ),
          Text(
            value,
            style: TextStyle(color: colors.onBackground.withOpacity(0.8)),
          ),
        ],
      ),
    );
  }
}