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
    // Providers
    final offers = context.watch<OfferProvider>().offers;
    final cuisinesProvider = context.watch<CuisineProvider>();
    final restaurants = context.watch<RestaurantProvider>().restaurants;

    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          // ---------------- AppBar ----------------
          SliverAppBar(
            expandedHeight: 200,
            pinned: true,
            backgroundColor: const Color(0xFF0D7377),
            flexibleSpace: FlexibleSpaceBar(
              background: _buildHeader(),
            ),
          ),

          // ---------------- Body ----------------
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: Column(
                children: [
                  /// ---------------- Offers Carousel ------------------
                  OffersCarousel(
                    offers: offers,
                    onBookNow: () {
                      // Navigate to restaurant detail (or offer detail)
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => RestaurantDetailScreen(restaurantId: restaurants[0].id),
                        ),
                      );
                    },
                  ),

                  const SizedBox(height: 32),

                  /// ---------------- Cuisines Section ------------------
                  CuisinesSection(
                    cuisines: cuisinesProvider.cuisines,
                    onCuisineSelected: cuisinesProvider.selectCuisine,
                    onSeeAll: () {
                      // Optional: navigate to full cuisines list
                    },
                  ),

                  const SizedBox(height: 32),

                  /// ---------------- Popular Restaurants ------------------
                  PopularRestaurants(
                    restaurants: restaurants,
                    onRestaurantTap: (String id) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => RestaurantDetailScreen(restaurantId: id),
                        ),
                      );
                    },
                    onToggleFavorite: (String id) {
                      context.read<RestaurantProvider>().toggleFavorite(id);
                    },
                    onSeeAll: () {
                      // Optional: navigate to full restaurants list
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

  /// ---------------- Header Widget ----------------
  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.all(16),
      alignment: Alignment.bottomLeft,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF0D7377), Color(0xFF0D7377)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: const Text(
        "Hello, username!",
        style: TextStyle(
          fontSize: 26,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}