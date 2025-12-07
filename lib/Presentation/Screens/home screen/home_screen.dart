import 'package:flutter/material.dart';
import 'package:intershipflutter/Constans/widgets/home%20screen%20widgets/cuisines_section.dart';
import 'package:intershipflutter/Constans/widgets/home%20screen%20widgets/offers_carousel.dart';
import 'package:intershipflutter/Constans/widgets/home%20screen%20widgets/popular_restaurants.dart';
import 'package:intershipflutter/Presentation/Screens/restaurant%20detail%20screen/restaurant_detail_screen.dart';
import 'package:intershipflutter/businessLogic/home%20provideres/cuisine_provider.dart';
import 'package:intershipflutter/businessLogic/home%20provideres/offer_provider.dart';
import 'package:intershipflutter/businessLogic/restaurant%20provider/restaurant_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
            expandedHeight: 260,
            pinned: true,
            backgroundColor: const Color(0xFF085651),
            flexibleSpace: FlexibleSpaceBar(
              background: _buildHeader(username: 'youssef'),
            ),
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 24),
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
                    onSeeAll: () {},
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
                    onSeeAll: () {},
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
      color: const Color(0xFF0D7377),
      child: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 20, 16, 24),
            child: Stack(
              children: [
                /// BACKGROUND DECORATIONS
                Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                    width: 130,
                    height: 130,
                    decoration: BoxDecoration(
                      color: const Color(0xFF0D7377).withOpacity(0.4),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                Positioned(
                  top: 40,
                  left: 30,
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: const Color(0xFF0D7377).withOpacity(0.25),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                Positioned(
                  top: 80,
                  right: 80,
                  child: Container(
                    width: 25,
                    height: 25,
                    decoration: BoxDecoration(
                      color: const Color(0xFF0D7377).withOpacity(0.25),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),

                /// MAIN CONTENT
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: Container(
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
                    ),

                    const SizedBox(height: 20),

                    Text(
                      "Hello, $username!",
                      style: const TextStyle(
                        fontSize: 28,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 6),

                    const Text(
                      "Begin your journey to exceptional dining\nexperiences today.",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white70,
                        height: 1.3,
                      ),
                    ),

                    const SizedBox(height: 22),

                    TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white, // White background
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            12,
                          ), // Rounded corners
                          borderSide: BorderSide.none, // No border line
                        ),
                        prefixIcon: const Icon(
                          Icons.search,
                          color: Colors.grey,
                        ),
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
      ),
    );
  }
}
