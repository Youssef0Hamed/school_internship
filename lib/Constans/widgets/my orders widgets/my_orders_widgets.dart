import 'package:flutter/material.dart';

class MyOrdersWidgets extends StatelessWidget {
  const MyOrdersWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Center(
      child: Container(
        height: 192,
        width: 330,
        decoration: BoxDecoration(
          color: isDark ? Colors.grey[850] : Colors.grey[200],
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
                    width: 160,
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
                    width: 130,
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
                                width: 53,
                                decoration: BoxDecoration(
                                  color: isDark ? Colors.grey[800] : Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: const [
                                    Text(
                                      "4.3",
                                      style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold,
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
                                  color: isDark ? Colors.white70 : Colors.black54,
                                ),
                                const SizedBox(width: 3),
                                Text(
                                  "Mexican",
                                  style: TextStyle(
                                    fontSize: 7,
                                    color: isDark ? Colors.white70 : Colors.black54,
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
                                  color: isDark ? Colors.white70 : Colors.black54,
                                ),
                                const SizedBox(width: 3),
                                Text(
                                  "1.11 norway london",
                                  style: TextStyle(
                                    fontSize: 7,
                                    color: isDark ? Colors.white70 : Colors.black54,
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
                  Container(
                    width: 140,
                    height: 44,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                      child: Text(
                        "RE-Book",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ),
                  ),
                  // Review
                  Container(
                    width: 140,
                    height: 44,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Center(
                      child: Text(
                        "review",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
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