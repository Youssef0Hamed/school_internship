import 'package:flutter/material.dart';
import 'package:intershipflutter/Constans/models/favouriteCardModel.dart';
import 'package:intershipflutter/Constans/widgets/colors.dart';
import 'package:intershipflutter/Constans/widgets/favourite%20card%20widget/favourite_card_widget.dart';
import 'package:intershipflutter/Presentation/Screens/home%20screen/home_screen.dart';
import 'package:intershipflutter/businessLogic/home%20provideres/cuisine_provider.dart'
    show CuisineProvider;
import 'package:intershipflutter/businessLogic/restaurant%20provider/restaurant_provider.dart';
import 'package:provider/provider.dart';

class Favourite_screen extends StatefulWidget {
  const Favourite_screen({super.key});

  @override
  State<Favourite_screen> createState() => _Favourite_screenState();
}

class _Favourite_screenState extends State<Favourite_screen> {
  String _activeFilter = "all";

  // FILTER BUTTON BUILDER
  Widget _buildFilterButton(String filterId, String label) {
    final isActive = _activeFilter == filterId;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            _activeFilter = filterId;
          });

          // Update provider too
          context.read<CuisineProvider>().selectCuisine(filterId);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: isActive ? const Color(0xFF0D7377) : Colors.white,
          foregroundColor: isActive ? Colors.white : const Color(0xFF0D7377),
          side: const BorderSide(color: Color(0xFF0D7377), width: 2),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final restaurants = context.watch<RestaurantProvider>().restaurants;
    final cuisinesProvider = context.watch<CuisineProvider>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Favourites",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      extendBodyBehindAppBar: false,
      backgroundColor: Colors.white,

      body: SingleChildScrollView(
        child: Column(
          children: [
            // CATEGORY FILTER BUTTONS
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: SizedBox(
                height: 37,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: cuisinesProvider.cuisines.length,
                  itemBuilder: (_, i) {
                    final cuisine = cuisinesProvider.cuisines[i];
                    return _buildFilterButton(cuisine.id, cuisine.name);
                  },
                ),
              ),
            ),

            const SizedBox(height: 10),

            // FAVOURITE CARDS
            ListView.builder(
              itemCount: restaurants.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (_, i) {
                final restaurant = restaurants[i];

                return Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 20,
                  ),
                  child: Stack(
                    children: [
                      FavouriteCard(
                        model: Favouritecardmodel(
                          imageUrl: restaurant.images.first,
                          title: restaurant.name,
                          rate: restaurant.rating,
                          isFavourite: restaurant.isFavorite,
                          discount:
                              int.tryParse(
                                restaurant.discount.replaceAll('% off', ''),
                              ) ??
                              0,
                        ),
                      ),

                      // ❤️ Favorite Icon
                      Positioned(
                        top: 8,
                        right: 8,
                        child: GestureDetector(
                          onTap: () {
                            Provider.of<RestaurantProvider>(
                              context,
                              listen: false,
                            ).toggleFavorite(restaurant.id);
                          },
                          child: Container(
                            padding: const EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 4,
                                ),
                              ],
                            ),
                            child: Icon(
                              restaurant.isFavorite
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
