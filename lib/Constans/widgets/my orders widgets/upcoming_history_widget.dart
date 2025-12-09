import 'package:flutter/material.dart';

class UpcomingHistoryToggle extends StatefulWidget {
  const UpcomingHistoryToggle({super.key});

  @override
  State<UpcomingHistoryToggle> createState() => _UpcomingHistoryToggleState();
}

class _UpcomingHistoryToggleState extends State<UpcomingHistoryToggle> {
  bool isUpcoming = true;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final width = MediaQuery.of(context).size.width;

    return Center(
      child: Container(
        height: 42,
        width: width * 0.78,
        padding: const EdgeInsets.all(3),
        decoration: BoxDecoration(
          color: isDark ? Colors.grey[800] : const Color(0xffF2F2F2),
          borderRadius: BorderRadius.circular(22),
        ),
        child: Row(
          children: [
            _item("Upcoming", isSelected: isUpcoming, onTap: () {
              setState(() => isUpcoming = true);
            }, colors: colors),
            _item("History", isSelected: !isUpcoming, onTap: () {
              setState(() => isUpcoming = false);
            }, colors: colors),
          ],
        ),
      ),
    );
  }

  Widget _item(String text,
      {required bool isSelected, required VoidCallback onTap, required ColorScheme colors}) {
    final mainColor = const Color(0xff0E7C7B);

    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: isSelected ? Colors.white : Colors.transparent,
            borderRadius: BorderRadius.circular(20),
            border: isSelected ? Border.all(color: mainColor, width: 1) : null,
          ),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: isSelected ? mainColor : Colors.grey,
            ),
          ),
        ),
      ),
    );
  }
}