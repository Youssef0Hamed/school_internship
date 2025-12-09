import 'package:flutter/material.dart';

class MyOrdersWidgets extends StatelessWidget {
  final String reviewText;
  final String rebookText;
  final VoidCallback onRebook;
  final VoidCallback onReview;

  const MyOrdersWidgets({
    super.key,
    required this.reviewText,
    required this.rebookText,
    required this.onRebook,
    required this.onReview,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Center(
      child: Container(
        height: 192,
        width: MediaQuery.of(context).size.width * 0.90,
        decoration: BoxDecoration(
          color: colors.surface, // 🔥 Theme aware background
          boxShadow: [
            BoxShadow(
              color: isDark
                  ? Colors.white.withOpacity(0.1)           // softer for dark
                  : Colors.black.withOpacity(0.20),          // stronger for light
              blurRadius: 6,
              spreadRadius: 1,
              offset: const Offset(0, 2),
            ),
          ],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  /// IMAGE
                  Container(
                    height: 100,
                    width: MediaQuery.of(context).size.width * 0.40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: const DecorationImage(
                        image: AssetImage(
                          "assets/e09fb6628eac6a0ab1526b10543ab47ff30bfbef.jpg",
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 5),

                  /// DETAILS
                  Container(
                    height: 113,
                    width: MediaQuery.of(context).size.width * 0.45,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Column(
                        children: [
                          /// TITLE + RATING
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 8),
                                child: Text(
                                  "Tacos",
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    color: colors.onSurface, // 🔥 Theme aware
                                  ),
                                ),
                              ),
                              Container(
                                height: 28,
                                width: 45,
                                decoration: BoxDecoration(
                                  color: colors.surfaceVariant, // 🔥 better theme color
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 5),
                                      child: Text(
                                        "4.3",
                                        style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold,
                                          color: colors.onSurface,
                                        ),
                                      ),
                                    ),
                                    const Icon(
                                      Icons.star_rate_rounded,
                                      color: Colors.amber,
                                      size: 20,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),

                          /// CUISINE
                          Padding(
                            padding: const EdgeInsets.only(top: 5, left: 8),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.remove_circle_outline_sharp,
                                  size: 14,
                                  color: colors.onSurface.withOpacity(0.6),
                                ),
                                const SizedBox(width: 3),
                                Text(
                                  "Mexican",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: colors.onSurface.withOpacity(0.6),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          /// LOCATION
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.location_on_outlined,
                                  size: 14,
                                  color: colors.onSurface.withOpacity(0.6),
                                ),
                                const SizedBox(width: 3),
                                Text(
                                  "1.11 norway london",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: colors.onSurface.withOpacity(0.6),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 10),

              /// BUTTONS
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  /// REVIEW (OUTLINED)
                  GestureDetector(
                    onTap: onReview,
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.40,
                      height: 44,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: colors.primary),
                      ),
                      child: Center(
                        child: Text(
                          reviewText,
                          style: TextStyle(
                            color: colors.primary,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),

                  /// RE-BOOK (FILLED)
                  GestureDetector(
                    onTap: onRebook,
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.40,
                      height: 44,
                      decoration: BoxDecoration(
                        color: colors.primary,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(
                        child: Text(
                          rebookText,
                          style: const TextStyle(
                            color: Colors.white,   // always white on primary
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}