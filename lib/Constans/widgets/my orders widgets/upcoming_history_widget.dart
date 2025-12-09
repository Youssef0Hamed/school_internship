import 'package:flutter/material.dart';

class UpcomingHistoryToggle extends StatelessWidget {
  const UpcomingHistoryToggle({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 42,
        width: MediaQuery.of(context).size.width * 0.78, // ✅ نفس العرض
        padding: const EdgeInsets.all(3),
        decoration: BoxDecoration(
          color: const Color(0xffF2F2F2),
          borderRadius: BorderRadius.circular(22),
        ),
        child: Row(
          children: [
            _item("Upcoming", isSelected: true),
            _item("History"),
          ],
        ),
      ),
    );
  }

  Widget _item(String text, {bool isSelected = false}) {
    return Expanded(
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
          border: isSelected
              ? Border.all(color: const Color(0xff0E7C7B), width: 1)
              : null,
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: isSelected
                ? const Color(0xff0E7C7B)
                : Colors.grey,
          ),
        ),
      ),
    );
  }
}
