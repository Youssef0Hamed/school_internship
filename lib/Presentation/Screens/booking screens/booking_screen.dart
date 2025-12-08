import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intershipflutter/Presentation/Screens/booking%20screens/details.dart';
import 'package:intershipflutter/Presentation/Screens/home%20screen/home_screen.dart';
import 'package:intershipflutter/Presentation/Screens/home.dart';
import 'package:table_calendar/table_calendar.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({super.key});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  DateTime _focusedDay = DateTime(2026);
  DateTime? _selectedDay;

  int hour = 12;
  int minute = 59;
  bool isPM = true;

  int _count = 1;

  void _increment() {
    setState(() {
      _count++;
    });
  }

  void _decrement() {
    setState(() {
      if (_count > 0) _count--; // Optional: Prevent negative values
    });
  }

  String selected = 'indoor';

  void _showWarning(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
          color: Color(0xFF085651),
        ),
        title: Text(
          "Tacos",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              children: [
                Text(
                  "4.3",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(width: 2),
                Icon(Icons.star, color: Colors.amber, size: 14),
              ],
            ),
          )
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // ----------------------- CALENDAR -----------------------
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 1,
                        spreadRadius: 0,
                        color: Colors.black12,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: TableCalendar(
                    firstDay: DateTime(2025),
                    lastDay: DateTime(2030),
                    focusedDay: _focusedDay,
                    selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
                    rangeSelectionMode: RangeSelectionMode.toggledOff,
                    onDaySelected: (selectedDay, focusedDay) {
                      setState(() {
                        _selectedDay = selectedDay;
                        _focusedDay = focusedDay;
                      });
                    },
                    headerStyle: const HeaderStyle(
                      titleCentered: true,
                      formatButtonVisible: false,
                      titleTextStyle: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                      leftChevronIcon:
                          Icon(Icons.chevron_left, color: Color(0xFF085651)),
                      rightChevronIcon:
                          Icon(Icons.chevron_right, color: Color(0xFF085651)),
                    ),
                    daysOfWeekStyle: const DaysOfWeekStyle(
                      weekdayStyle: TextStyle(color: Colors.black),
                      weekendStyle: TextStyle(color: Color(0xFF085651)),
                    ),
                    calendarStyle: CalendarStyle(
                      defaultTextStyle: TextStyle(color: Colors.black),
                      weekendTextStyle: TextStyle(color: Colors.black),
                      todayDecoration: BoxDecoration(
                        color: Colors.black12,
                        shape: BoxShape.circle,
                      ),
                      selectedDecoration: BoxDecoration(
                        color: Color(0xFF085651),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 25),

                // ----------------------- TIME PICKER -----------------------
                Container(
                  height: 111,
                  width: MediaQuery.of(context).size.width * 0.85,
                  padding: EdgeInsets.symmetric(vertical: 0, horizontal: 25),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 4,
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _pickerColumn(
                        value: hour.toString().padLeft(2, "0"),
                        onUp: () => setState(() => hour = hour % 12 + 1),
                        onDown: () =>
                            setState(() => hour = (hour - 2 + 12) % 12 + 1),
                      ),
                      SizedBox(width: 70),
                      Text(":",
                          style: TextStyle(
                              fontSize: 28, fontWeight: FontWeight.bold)),
                      SizedBox(width: 70),
                      _pickerColumn(
                        value: minute.toString().padLeft(2, "0"),
                        onUp: () => setState(() => minute = (minute + 1) % 60),
                        onDown: () =>
                            setState(() => minute = (minute - 1 + 60) % 60),
                      ),
                      SizedBox(width: 100),
                      _pickerColumn(
                        value: isPM ? "PM" : "AM",
                        onUp: () => setState(() => isPM = !isPM),
                        onDown: () => setState(() => isPM = !isPM),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Choose the number of guests",
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.85,
                  decoration: BoxDecoration(
                    color: Colors.grey[200], // Background color
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Decrement button
                      Padding(
                        padding: const EdgeInsets.all(0),
                        child: CircleAvatar(
                          radius: 30,
                          backgroundColor: Color(0xFF085651),
                          child: IconButton(
                            onPressed: _decrement,
                            icon: const Icon(Icons.remove),
                            color: Colors.white,
                          ),
                        ),
                      ),
                      // Number display
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          '$_count',
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                      // Increment button
                      Padding(
                        padding: const EdgeInsets.all(0),
                        child: CircleAvatar(
                          radius: 30,
                          backgroundColor: Color(0xFF085651),
                          child: IconButton(
                            onPressed: _increment,
                            icon: const Icon(Icons.add),
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Indoor Option
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selected = 'indoor';
                        });
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.40,
                        height: 45,
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                            color: selected == 'indoor'
                                ? Colors.white
                                : Colors.white,
                            borderRadius: BorderRadius.circular(6),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.21),
                                blurRadius: 4,
                              ),
                            ]),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Circle
                            Text(
                              'indoor',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: selected == 'indoor'
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                              ),
                            ),
                            SizedBox(width: 8),
                            Container(
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: selected == 'indoor'
                                    ? Color(0xFF085651)
                                    : Colors.transparent,
                                border: Border.all(
                                    color: Color(0xFF085651), width: 2),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    SizedBox(width: 16),

                    // Outdoor Option
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selected = 'outdoor';
                        });
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.40,
                        height: 45,
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                            color: selected == 'outdoor'
                                ? Colors.white
                                : Colors.white,
                            borderRadius: BorderRadius.circular(6),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.21),
                                blurRadius: 4,
                              ),
                            ]),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Circle
                            Text(
                              'outdoor',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: selected == 'outdoor'
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                              ),
                            ),
                            SizedBox(width: 8),
                            Container(
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: selected == 'outdoor'
                                    ? Color(0xFF085651)
                                    : Colors.transparent,
                                border: Border.all(
                                    color: Color(0xFF085651), width: 2),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.40,
                      height: 40,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomeScreen(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(color: Color(0xFF085651)),
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Text(
                          "Cancel reservation",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 22,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.40,
                      height: 40,
                      child: ElevatedButton(
                        onPressed: () {
                          // Check day
                          if (_selectedDay == null) {
                            _showWarning("Please choose a day");
                            return;
                          }

                          // Check time (still default = not chosen)
                          if (hour == 12 && minute == 59) {
                            _showWarning("Please choose a time");
                            return;
                          }

                          // All good ✅
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Details(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF085651),
                          shape: RoundedRectangleBorder(
                            side: BorderSide(color: Color(0xFF085651)),
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Text(
                          "Continue",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _pickerColumn({
    required String value,
    required VoidCallback onUp,
    required VoidCallback onDown,
  }) {
    return Column(
      children: [
        InkWell(
          onTap: onUp,
          child:
              Icon(Icons.keyboard_arrow_up, size: 35, color: Color(0xFF085651)),
        ),
        SizedBox(height: 5),
        Text(value,
            style: TextStyle(
              fontSize: 22,
            )),
        SizedBox(height: 5),
        InkWell(
          onTap: onDown,
          child: Icon(Icons.keyboard_arrow_down,
              size: 35, color: Color(0xFF085651)),
        ),
      ],
    );
  }
}
