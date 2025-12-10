import 'dart:math';
import 'package:flutter/material.dart';
import 'package:intershipflutter/Constans/widgets/colors.dart';
import 'package:intershipflutter/Constans/widgets/favourite card widget/reservation_item.dart';
import 'package:intershipflutter/Constans/widgets/my orders widgets/my_orders_widgets.dart';
import 'package:intershipflutter/Presentation/admin_screens/admin_setting_screen.dart';
import 'package:intershipflutter/Presentation/admin_screens/creat_rest_screen.dart';
import 'package:intershipflutter/Presentation/admin_screens/edit_screen.dart';
import 'package:intershipflutter/Presentation/Screens/settings%20screen/settings_screen.dart';
import 'package:intershipflutter/businessLogic/Theme_Provider.dart';
import 'package:provider/provider.dart';

final Random rnd = Random();

class RestaurantListScreen extends StatefulWidget {
  const RestaurantListScreen({Key? key}) : super(key: key);

  @override
  State<RestaurantListScreen> createState() => _RestaurantListScreenState();
}

class _RestaurantListScreenState extends State<RestaurantListScreen> {
  int selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, _) {
        final currentColors =
            themeProvider.isDark ? AppColors.dark : AppColors.light;

        return Scaffold(
          backgroundColor: currentColors.backgroundColor,
          floatingActionButton: FloatingActionButton(
            backgroundColor: currentColors.primary,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CreateRestaurantScreen(),
                ),
              );
            },
            child: const Icon(Icons.add, size: 30, color: Colors.white),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                expandedHeight: 200,
                pinned: true,
                backgroundColor: currentColors.primary,
                actions: [
                  IconButton(
                    splashRadius: 22,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => AdminSettingsScreen(),
                        ),
                      );
                    },
                    icon: const Icon(
                      Icons.settings_rounded,
                      color: Colors.white,
                      size: 28,
                    ),
                  ),
                ],
                flexibleSpace: FlexibleSpaceBar(
                  background: _buildHeader(
                    context: context,
                    username: "Youssef",
                    colors: currentColors,
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () => setState(() => selectedTab = 0),
                              child: Column(
                                children: [
                                  Text(
                                    "Restaurants",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: selectedTab == 0
                                          ? const Color(0xFF0D6E68)
                                          : Colors.grey.shade600,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Container(
                                    height: 3,
                                    color: selectedTab == 0
                                        ? const Color(0xFF0D6E68)
                                        : Colors.transparent,
                                  )
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () => setState(() => selectedTab = 1),
                              child: Column(
                                children: [
                                  Text(
                                    "Reservations",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: selectedTab == 1
                                          ? const Color(0xFF0D6E68)
                                          : Colors.grey.shade600,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Container(
                                    height: 3,
                                    color: selectedTab == 1
                                        ? const Color(0xFF0D6E68)
                                        : Colors.transparent,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      if (selectedTab == 0)
                        Column(
                          children: [
                            MyOrdersWidgets(
                              rebookText: "Edit",
                              reviewText: "Delete",
                              onRebook: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          EditRestaurantScreen(),
                                    ));
                              },
                              onReview: () {},
                            ),
                            SizedBox(height: 18),
                            MyOrdersWidgets(
                              rebookText: "Edit",
                              reviewText: "Delete",
                              onRebook: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          EditRestaurantScreen(),
                                    ));
                              },
                              onReview: () {},
                            ),
                            SizedBox(height: 18),
                            MyOrdersWidgets(
                              rebookText: "Edit",
                              reviewText: "Delete",
                              onRebook: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          EditRestaurantScreen(),
                                    ));
                              },
                              onReview: () {},
                            ),
                          ],
                        ),
                      if (selectedTab == 1)
                        ListView(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          children: [
                            ReservationItem(
                              name: "Leo messi",
                              restaurant: "Tacos",
                              phone: "0122222222",
                              guests: 9,
                              onAccept: () {},
                              onCancel: () {},
                            ),
                            ReservationItem(
                              name: "Leo messi",
                              restaurant: "Tacos",
                              phone: "0122222222",
                              guests: 9,
                              onAccept: () {},
                              onCancel: () {},
                            ),
                          ],
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildHeader({
    required BuildContext context,
    required String username,
    required AppColorScheme colors,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: colors.primary,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 20, 16, 24),
          child: Stack(
            children: [
              for (int i = 0; i < 5; i++)
                Positioned(
                  top: rnd.nextDouble() * 120,
                  right: rnd.nextDouble() * 120,
                  child: Container(
                    width: rnd.nextDouble() * 100 + 20,
                    height: rnd.nextDouble() * 100 + 20,
                    decoration: const BoxDecoration(
                      color: Color(0x330D6E68),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hello, $username!",
                    style: const TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    "Begin your journey to exceptional dining experiences today.",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white.withOpacity(0.7),
                      height: 1.3,
                    ),
                  ),
                  const SizedBox(height: 22),
                  TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: colors.backgroundColor,
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 16),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                      prefixIcon: const Icon(Icons.search, color: Colors.grey),
                      hintText: "Search",
                      hintStyle: const TextStyle(color: Colors.grey),
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
