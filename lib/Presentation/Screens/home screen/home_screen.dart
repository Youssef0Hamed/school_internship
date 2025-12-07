import 'package:flutter/material.dart';
import 'package:intershipflutter/Constans/widgets/home%20screen%20widgets/cuisines_section.dart';
import 'package:intershipflutter/Constans/widgets/home%20screen%20widgets/offers_carousel.dart';
import 'package:intershipflutter/Constans/widgets/home%20screen%20widgets/popular_restaurants.dart';
import 'package:intershipflutter/Presentation/Screens/restaurant%20detail%20screen/restaurant_detail_screen.dart';
import 'package:intershipflutter/businessLogic/home%20provideres/cuisine_provider.dart';
import 'package:intershipflutter/businessLogic/home%20provideres/offer_provider.dart';
import 'package:intershipflutter/businessLogic/restaurant%20provider/restaurant_provider.dart';
import 'package:provider/provider.dart';
import 'dart:math';

final Random rnd = Random();

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  BuildContext get context => context;

  @override
  Widget build(BuildContext context) {
    final offers = context.watch<OfferProvider>().offers;
    final cuisinesProvider = context.watch<CuisineProvider>();
    final restaurants = context.watch<RestaurantProvider>().restaurants;

    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            pinned: false,
            flexibleSpace: FlexibleSpaceBar(
              background: _buildHeader(username: 'youssef'),
            ),
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Column(
                children: [
                  OffersCarousel(
                    offers: offers,
                    onBookNow: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (_) => RestaurantDetailScreen(
                                restaurantId: restaurants[0].id,
                              ),
                        ),
                      );
                    },
                  ),

                  const SizedBox(height: 16),

                  CuisinesSection(
                    cuisines: cuisinesProvider.cuisines,
                    onCuisineSelected: cuisinesProvider.selectCuisine,
                  ),

                  const SizedBox(height: 20),

                  PopularRestaurants(
                    restaurants: restaurants,
                    onRestaurantTap: (String id) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (_) => RestaurantDetailScreen(restaurantId: id),
                        ),
                      );
                    },
                    onToggleFavorite: (String id) {
                      context.read<RestaurantProvider>().toggleFavorite(id);
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// ================================================================
  /// FIXED HEADER — Guaranteed 0 overflow
  /// ================================================================
  Widget _buildHeader({required String username}) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFF085651),
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
              for (int i = 0; i < 4; i++)
                /// BACKGROUND DECORATIONS
                Positioned(
                  top: rnd.nextDouble() * 120,
                  right: rnd.nextDouble() * 120,
                  child: Container(
                    width: rnd.nextDouble() * 80 + 20,
                    height: rnd.nextDouble() * 80 + 20,
                    decoration: BoxDecoration(
                      color: const Color(0xFF0D6E68),
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF0D6E68).withOpacity(0.2),
                          blurRadius: 20,
                          spreadRadius: 5,
                          offset: const Offset(0, 0),
                        ),
                      ],
                    ),
                  ),
                ),
              Positioned(
                top: rnd.nextDouble() * 120,
                left: rnd.nextDouble() * 120,
                child: Container(
                  width: rnd.nextDouble() * 80 + 20,
                  height: rnd.nextDouble() * 80 + 20,
                  decoration: BoxDecoration(
                    color: const Color(0xFF0D6E68),
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF0D6E68).withOpacity(0.2),
                        blurRadius: 20,
                        spreadRadius: 5,
                        offset: const Offset(0, 0),
                      ),
                    ],
                  ),
                ),
              ),

              /// MAIN CONTENT
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
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

                            const Text(
                              "Begin your journey to exceptional dining experiences today.",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white70,
                                height: 1.3,
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(width: 18), // FIXED
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white, width: 1.5),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Icon(
                          Icons.notifications_none,
                          color: Colors.white,
                          size: 26,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 22),

                  TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                      ),
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
