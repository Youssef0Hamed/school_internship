import 'package:flutter/material.dart';

class ReservationItem extends StatelessWidget {
  final String name;
  final String restaurant;
  final String phone;
  final int guests;
  final VoidCallback onAccept;
  final VoidCallback onCancel;

  const ReservationItem({
    super.key,
    required this.name,
    required this.restaurant,
    required this.phone,
    required this.guests,
    required this.onAccept,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.only(bottom: 18),
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).brightness == Brightness.dark
                ? const Color.fromARGB(255, 255, 255, 255).withOpacity(0.3)
                : Colors.black.withOpacity(0.25),
            blurRadius: 3,
            spreadRadius: 0.50,
            offset: const Offset(0.55, 0.2),
          ),
        ],
      ),
      child: Column(
        children: [
          // -------- Row Data --------
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Avatar
              const CircleAvatar(
                radius: 28,
                backgroundColor: Colors.grey,
                child: Icon(Icons.person, color: Colors.white, size: 30),
              ),
              const SizedBox(width: 14),

              // Name & phone & restaurant
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "leo messi",
                    style: const TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    restaurant,
                    style: TextStyle(color: Colors.grey.shade600, fontSize: 13),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    phone,
                    style: TextStyle(color: Colors.grey.shade500, fontSize: 12),
                  ),
                ],
              ),
              const Spacer(),

              // Guests
              Column(
                children: [
                  const Text(
                    "Guests",
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                  Text(
                    "9",
                    style: const TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 17),
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(height: 16),

          // -------- Buttons Row --------
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: onCancel,
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: colors.primary, width: 1.6),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                  child: Text(
                    "Cancel",
                    style: TextStyle(
                        color: colors.primary, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: ElevatedButton(
                  onPressed: onAccept,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: colors.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                  child: const Text(
                    "Accept",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
