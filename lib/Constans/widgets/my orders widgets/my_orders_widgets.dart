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
          color: colors.surface,
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
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  // Image
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
                  // Details
                  Container(
                    height: 113,
                    width: MediaQuery.of(context).size.width * 0.45,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Column(
                        children: [
                          // Title & Rating
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
                                    color: isDark ? Colors.white : Colors.black,
                                  ),
                                ),
                              ),
                              Container(
                                height: 28,
                                width: 45,
                                decoration: BoxDecoration(
                                  color: isDark
                                      ? const Color.fromARGB(255, 32, 32, 32)
                                      : Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: const [
                                    Padding(
                                      padding: EdgeInsets.only(left: 5),
                                      child: Text(
                                        "4.3",
                                        style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Icon(
                                      Icons.star_rate_rounded,
                                      color: Colors.amber,
                                      size: 22,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          // Cuisine
                          Padding(
                            padding: const EdgeInsets.only(top: 5, left: 8),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.remove_circle_outline_sharp,
                                  size: 10,
                                  color:
                                      isDark ? Colors.white70 : Colors.black54,
                                ),
                                const SizedBox(width: 3),
                                Text(
                                  "Mexican",
                                  style: TextStyle(
                                    fontSize: 7,
                                    color: isDark
                                        ? Colors.white70
                                        : Colors.black54,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // Location
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.location_on_outlined,
                                  size: 10,
                                  color:
                                      isDark ? Colors.white70 : Colors.black54,
                                ),
                                const SizedBox(width: 3),
                                Text(
                                  "1.11 norway london",
                                  style: TextStyle(
                                    fontSize: 7,
                                    color: isDark
                                        ? Colors.white70
                                        : Colors.black54,
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
              // Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // RE-Book
                  GestureDetector(
                    onTap: onReview,
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.40,
                      height: 44,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                              color: Theme.of(context).colorScheme.primary)),
                      child: Center(
                        child: Text(
                          reviewText,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),

                  // Review
                  GestureDetector(
                    onTap: onRebook,
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.40,
                      height: 44,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(
                        child: Text(
                          rebookText,
                          style: const TextStyle(
                            color: Colors.white,
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
