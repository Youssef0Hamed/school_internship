import 'package:flutter/material.dart';
import 'package:intershipflutter/Presentation/widgets/home%20screen%20widgets/cuisines_section.dart';
import 'package:intershipflutter/Presentation/widgets/home%20screen%20widgets/offers_carousel.dart';
import 'package:intershipflutter/Presentation/widgets/home%20screen%20widgets/popular_restaurants.dart';
import 'package:intershipflutter/businessLogic/home%20provideres/cuisine_provider.dart';
import 'package:intershipflutter/businessLogic/home%20provideres/offer_provider.dart';
import 'package:intershipflutter/businessLogic/home%20provideres/restaurant_provider.dart';
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
            expandedHeight: 200,
            pinned: true,
            backgroundColor: const Color(0xFF0D7377),
            flexibleSpace: FlexibleSpaceBar(
              background: _buildHeader(),
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
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Book Now")),
                      );
                    },
                  ),

                  const SizedBox(height: 32),

                  CuisinesSection(
                    cuisines: cuisinesProvider.cuisines,
                    onCuisineSelected: cuisinesProvider.selectCuisine,
                    onSeeAll: () {},
                  ),

                  const SizedBox(height: 32),

                  PopularRestaurants(
                    restaurants: restaurants,
                    onRestaurantTap: (id) {},
                    onToggleFavorite: (id) {},
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
        style: TextStyle(fontSize: 26, color: Colors.white),
      ),
    );
  }
}