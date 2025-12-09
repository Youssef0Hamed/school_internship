import 'package:flutter/material.dart';
import 'package:intershipflutter/Presentation/Screens/booking%20screens/details.dart';
import 'package:intershipflutter/Presentation/Screens/home%20screen/home_screen.dart';
import 'package:table_calendar/table_calendar.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({super.key});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  int hour = 12;
  int minute = 0;
  bool isPM = true;

  int _count = 1;
  String selected = 'indoor';

  void _increment() => setState(() => _count++);
  void _decrement() => setState(() { if (_count > 0) _count--; });

  void _showWarning(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: colors.background,
      appBar: AppBar(
        backgroundColor: colors.background,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back, color: colors.primary),
        ),
        title: Text(
          "Tacos",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: colors.onBackground,
          ),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Row(
              children: [
                Text(
                  "4.3",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    color: colors.onBackground,
                  ),
                ),
                const SizedBox(width: 2),
                const Icon(Icons.star, color: Colors.amber, size: 14),
              ],
            ),
          )
        ],
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [

                /// ---------------- CALENDAR ----------------
                Container(
                  margin: EdgeInsets.symmetric(horizontal: width * 0.03),
                  decoration: BoxDecoration(
                    color: colors.surface,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 1,
                        color: isDark ? Colors.black26 : Colors.black12,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: TableCalendar(
                    firstDay: DateTime(2025),
                    lastDay: DateTime(2030),
                    focusedDay: _focusedDay,
                    selectedDayPredicate: (day) =>
                        isSameDay(_selectedDay, day),

                    onDaySelected: (selectedDay, focusedDay) {
                      setState(() {
                        _selectedDay = selectedDay;
                        _focusedDay = focusedDay;
                      });
                    },

                    headerStyle: HeaderStyle(
                      titleCentered: true,
                      formatButtonVisible: false,
                      titleTextStyle: TextStyle(
                        fontSize: 20,
                        color: colors.onBackground,
                      ),
                      leftChevronIcon:
                          Icon(Icons.chevron_left, color: colors.primary),
                      rightChevronIcon:
                          Icon(Icons.chevron_right, color: colors.primary),
                    ),

                    daysOfWeekStyle: DaysOfWeekStyle(
                      weekdayStyle: TextStyle(color: colors.onBackground),
                      weekendStyle: TextStyle(color: colors.primary),
                    ),

                    calendarStyle: CalendarStyle(
                      defaultTextStyle:
                          TextStyle(color: colors.onBackground),
                      weekendTextStyle:
                          TextStyle(color: colors.primary),
                      todayDecoration: BoxDecoration(
                        color: colors.primary.withOpacity(0.2),
                        shape: BoxShape.circle,
                      ),
                      selectedDecoration: BoxDecoration(
                        color: colors.primary,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 25),

                /// ---------------- TIME PICKER ----------------
                Container(
                  width: width * 0.85,
                  padding: const EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 16,
                  ),
                  decoration: BoxDecoration(
                    color: colors.surface,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: isDark ? Colors.black26 : Colors.black12,
                        blurRadius: 4,
                      ),
                    ],
                  ),

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _pickerColumn(
                        value: hour.toString().padLeft(2, "0"),
                        onUp: () =>
                            setState(() => hour = hour % 12 + 1),
                        onDown: () =>
                            setState(() => hour = (hour - 2 + 12) % 12 + 1),
                        colors: colors,
                      ),

                      Text(
                        ":",
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: colors.onBackground,
                        ),
                      ),

                      _pickerColumn(
                        value: minute.toString().padLeft(2, "0"),
                        onUp: () =>
                            setState(() => minute = (minute + 1) % 60),
                        onDown: () =>
                            setState(() => minute = (minute - 1 + 60) % 60),
                        colors: colors,
                      ),

                      _pickerColumn(
                        value: isPM ? "PM" : "AM",
                        onUp: () => setState(() => isPM = !isPM),
                        onDown: () => setState(() => isPM = !isPM),
                        colors: colors,
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                /// ---------------- GUEST COUNT ----------------
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Choose the number of guests",
                    style: TextStyle(
                      fontSize: 20,
                      color: colors.onBackground,
                    ),
                  ),
                ),

                const SizedBox(height: 12),

                Container(
                  width: width * 0.85,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: isDark ? Colors.grey[800] : Colors.grey[200],
                    borderRadius: BorderRadius.circular(30),
                  ),

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                        radius: 25,
                        backgroundColor: colors.primary,
                        child: IconButton(
                          onPressed: _decrement,
                          icon: const Icon(Icons.remove),
                          color: Colors.white,
                        ),
                      ),

                      Text(
                        '$_count',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: colors.onBackground,
                        ),
                      ),

                      CircleAvatar(
                        radius: 25,
                        backgroundColor: colors.primary,
                        child: IconButton(
                          onPressed: _increment,
                          icon: const Icon(Icons.add),
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                /// ---------------- INDOOR/OUTDOOR ----------------
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _seatOption(
                      "indoor",
                      selected == "indoor",
                      () => setState(() => selected = "indoor"),
                      colors,
                    ),
                    const SizedBox(width: 16),
                    _seatOption(
                      "outdoor",
                      selected == "outdoor",
                      () => setState(() => selected = "outdoor"),
                      colors,
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                /// ---------------- BUTTONS ----------------
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: width * 0.40,
                      height: 45,
                      child: OutlinedButton(
                        onPressed: () => Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (_) => const HomeScreen()),
                        ),
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(color: colors.primary),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Text(
                          "Cancel reservation",
                          style: TextStyle(color: colors.onBackground),
                        ),
                      ),
                    ),

                    const SizedBox(width: 16),

                    SizedBox(
                      width: width * 0.40,
                      height: 45,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_selectedDay == null) {
                            _showWarning("Please choose a day");
                            return;
                          }
                          if (hour == 12 && minute == 0) {
                            _showWarning("Please choose a time");
                            return;
                          }

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const Details()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: colors.primary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text(
                          "Continue",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// ---------------- HELPER WIDGET 🎯 ----------------
  Widget _pickerColumn({
    required String value,
    required VoidCallback onUp,
    required VoidCallback onDown,
    required ColorScheme colors,
  }) {
    return Column(
      children: [
        InkWell(
          onTap: onUp,
          child: Icon(Icons.keyboard_arrow_up,
              size: 32, color: colors.primary),
        ),
        const SizedBox(height: 5),
        Text(
          value,
          style: TextStyle(
            fontSize: 22,
            color: colors.onBackground,
          ),
        ),
        const SizedBox(height: 5),
        InkWell(
          onTap: onDown,
          child: Icon(Icons.keyboard_arrow_down,
              size: 32, color: colors.primary),
        ),
      ],
    );
  }

  Widget _seatOption(
    String label,
    bool selected,
    VoidCallback onTap,
    ColorScheme colors,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.40,
        height: 45,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: colors.surface,
          borderRadius: BorderRadius.circular(6),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              blurRadius: 4,
            ),
          ],
        ),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: TextStyle(
                fontWeight:
                    selected ? FontWeight.bold : FontWeight.normal,
                color: colors.onBackground,
              ),
            ),

            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color:
                    selected ? colors.primary : Colors.transparent,
                border: Border.all(color: colors.primary, width: 2),
              ),
            ),
          ],
        ),
      ),
    );
  }
}