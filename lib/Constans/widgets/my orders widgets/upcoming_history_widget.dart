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
        child: Stack(
          children: [
            /// SLIDING BACKGROUND
            AnimatedAlign(
              duration: const Duration(milliseconds: 250),
              curve: Curves.fastOutSlowIn,
              alignment: isUpcoming ? Alignment.centerLeft : Alignment.centerRight,
              child: Container(
                width: (width * 0.78) / 2 - 6,
                height: 36,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: const Color(0xff0E7C7B), width: 1),
                ),
              ),
            ),

            /// TEXT BUTTONS
            Row(
              children: [
                _tab(
                  text: "Upcoming",
                  selected: isUpcoming,
                  onTap: () => setState(() => isUpcoming = true),
                ),
                _tab(
                  text: "History",
                  selected: !isUpcoming,
                  onTap: () => setState(() => isUpcoming = false),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _tab({
    required String text,
    required bool selected,
    required VoidCallback onTap,
  }) {
    const mainColor = Color(0xff0E7C7B);

    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.translucent,
        child: Center(
          child: AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 250),
            style: TextStyle(
              color: selected ? mainColor : Colors.grey,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
            child: Text(text),
          ),
        ),
      ),
    );
  }
}