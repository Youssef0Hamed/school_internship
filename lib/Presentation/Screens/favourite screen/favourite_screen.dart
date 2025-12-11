import 'package:flutter/material.dart';
import 'package:intershipflutter/Constans/models/favouriteCardModel.dart';
import 'package:intershipflutter/Constans/widgets/colors.dart';
import 'package:intershipflutter/Constans/widgets/favourite%20card%20widget/favourite_card_widget.dart';
import 'package:intershipflutter/businessLogic/home%20provideres/cuisine_provider.dart'
    show CuisineProvider;
import 'package:intershipflutter/businessLogic/restaurant%20provider/restaurant_provider.dart';
import 'package:provider/provider.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  String _activeFilter = "all";

  // FILTER BUTTON BUILDER
  Widget _buildFilterButton(String filterId, String label, AppColorScheme colors) {
    final isActive = _activeFilter == filterId;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      child: ElevatedButton(
        onPressed: () {
          setState(() => _activeFilter = filterId);
          context.read<CuisineProvider>().selectCuisine(filterId);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: isActive ? colors.primary : colors.surface,
          foregroundColor: isActive ? colors.surface : colors.primary,
          side: BorderSide(color: colors.primary, width: 2),
          padding: const EdgeInsets.symmetric(horizontal: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 12,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme.brightness == Brightness.dark
        ? AppColors.dark
        : AppColors.light;

    final restaurants = context.watch<RestaurantProvider>().restaurants;
    final cuisinesProvider = context.watch<CuisineProvider>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: colors.surface,
        title: Text(
          "Favourites",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: colors.text,
          ),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: colors.text),
      ),
      backgroundColor: colors.backgroundColor,
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
                    return _buildFilterButton(cuisine.id, cuisine.name, colors);
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
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Stack(
                    children: [
                      FavouriteCard(
                        model: Favouritecardmodel(
                          imageUrl: restaurant.images.first,
                          title: restaurant.name,
                          rate: restaurant.rating,
                          isFavourite: restaurant.isFavorite,
                          discount: int.tryParse(
                                  restaurant.discount.replaceAll('% off', '')) ??
                              0,
                        ), restaurantId: '${restaurant.id}',
                      ),

                      // ❤️ Favorite Icon
                      Positioned(
                        top: 8,
                        right: 8,
                        child: GestureDetector(
                          onTap: () {
                            Provider.of<RestaurantProvider>(context, listen: false)
                                .toggleFavorite(restaurant.id);
                          },
                          child: Container(
                            padding: const EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              color: colors.surface,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: colors.primary.withOpacity(0.2),
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