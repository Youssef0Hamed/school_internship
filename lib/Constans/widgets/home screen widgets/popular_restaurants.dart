import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:intershipflutter/Constans/models/restaurant%20detail%20models/restaurant_model.dart';
import 'package:intershipflutter/Presentation/Screens/restaurant%20detail%20screen/restaurant_detail_screen.dart';
import 'package:intershipflutter/businessLogic/restaurant%20provider/restaurant_provider.dart';
import 'package:provider/provider.dart';

class PopularRestaurants extends StatefulWidget {
  final List<RestaurantModel> restaurants;
  final Function(String)? onToggleFavorite;
  final VoidCallback? onSeeAll;

  const PopularRestaurants({
    Key? key,
    required this.restaurants,
    this.onToggleFavorite,
    this.onSeeAll,
    required Null Function(String id) onRestaurantTap,
  }) : super(key: key);

  @override
  State<PopularRestaurants> createState() => _PopularRestaurantsState();
}

class _PopularRestaurantsState extends State<PopularRestaurants> {
  late List<RestaurantModel> _restaurants;
  String _activeFilter = 'great-offers';

  @override
  void initState() {
    super.initState();
    _restaurants = List.from(widget.restaurants);
  }

  void _toggleFavorite(String restaurantId) {
    setState(() {
      final index = _restaurants.indexWhere((r) => r.id == restaurantId);
      if (index != -1) {
        _restaurants[index].isFavorite = !_restaurants[index].isFavorite;
      }
    });
    widget.onToggleFavorite?.call(restaurantId);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Column(
      children: [
        // HEADER
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Popular restaurants',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: colors.onBackground,
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 16),

        // FILTER TABS
        SizedBox(
          height: 40,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            children: [
              _buildFilterButton('great-offers', 'Great offers', colors, theme),
              _buildFilterButton('newest', 'Newest', colors, theme),
              _buildFilterButton('rating', 'Rating 4.5+', colors, theme),
            ],
          ),
        ),

        const SizedBox(height: 16),

        // GRID LIST
        SizedBox(
          height: 230,
          child: GridView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              childAspectRatio: 0.78,
              crossAxisSpacing: 12,
              mainAxisSpacing: 16,
            ),
            itemCount: _restaurants.length,
            itemBuilder: (context, index) {
              final restaurant = _restaurants[index];
              return _buildRestaurantCard(restaurant, colors, theme);
            },
          ),
        ),
      ],
    );
  }

  // FILTER BUTTON BUILDER
  Widget _buildFilterButton(
    String filterId,
    String label,
    ColorScheme colors,
    dynamic theme,
  ) {
    final isActive = _activeFilter == filterId;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            _activeFilter = filterId;
          });
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: isActive ? colors.primary : colors.surface,
          foregroundColor: isActive ? colors.onPrimary : colors.primary,
          side: BorderSide(color: colors.primary, width: 2),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 12,
            color:
                theme.brightness == Brightness.dark
                    ? Colors.white
                    : Colors.black,
            // color: isActive ? Colors.white : colors.primary,
          ),
        ),
      ),
    );
  }

  // RESTAURANT CARD
  Widget _buildRestaurantCard(
    RestaurantModel restaurant,
    ColorScheme colors,
    ThemeData theme,
  ) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => RestaurantDetailScreen(restaurantId: restaurant.id),
          ),
        );
      },
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: colors.surface,
              borderRadius: const BorderRadius.all(Radius.circular(12)),
              boxShadow: [
                BoxShadow(
                  color:
                      theme.brightness == Brightness.dark
                          ? Colors.white.withOpacity(0.3)
                          : Colors.black.withOpacity(0.25),
                  blurRadius: 4,
                  spreadRadius: 1,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            clipBehavior: Clip.antiAlias,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // IMAGE AREA
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12),
                      ),
                      child: CachedNetworkImage(
                        imageUrl: restaurant.images[0],
                        height: 120,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        placeholder:
                            (context, url) => Container(
                              color:
                                  theme.brightness == Brightness.dark
                                      ? Colors.grey[800]
                                      : Colors.grey[200],
                              child: const Center(
                                child: CircularProgressIndicator(),
                              ),
                            ),
                        errorWidget:
                            (context, url, error) => Container(
                              height: 120,
                              color:
                                  theme.brightness == Brightness.dark
                                      ? Colors.grey[700]
                                      : Colors.grey[300],
                              child: const Icon(Icons.broken_image),
                            ),
                      ),
                    ),

                    // FAVORITE ICON
                    Positioned(
                      top: 4,
                      right: 4,
                      child: GestureDetector(
                        onTap: () => _toggleFavorite(restaurant.id),
                        child: Container(
                          decoration: BoxDecoration(
                            color: colors.surface,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                blurRadius: 4,
                              ),
                            ],
                          ),
                          child: IconButton(
                            icon: Icon(
                              restaurant.isFavorite
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: Colors.red,
                            ),
                            onPressed: () {
                              Provider.of<RestaurantProvider>(
                                context,
                                listen: false,
                              ).toggleFavorite(restaurant.id);
                            },
                          ),
                        ),
                      ),
                    ),

                    // RATING BADGE
                    Positioned(
                      bottom: 8,
                      right: 8,
                      child: Container(
                        decoration: BoxDecoration(
                          color: colors.surface,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              blurRadius: 4,
                            ),
                          ],
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 4,
                        ),
                        child: Row(
                          children: [
                            Text(
                              restaurant.rating.toString(),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                                color: colors.onSurface,
                              ),
                            ),
                            const SizedBox(width: 2),
                            const Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 14,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

                // TEXT CONTENT
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // NAME
                      Text(
                        restaurant.name,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: colors.onSurface,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),

                      const SizedBox(height: 4),

                      // LOCATION
                      Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            size: 12,
                            color: colors.onSurface.withOpacity(0.6),
                          ),
                          const SizedBox(width: 4),
                          Expanded(
                            child: Text(
                              restaurant.location,
                              style: TextStyle(
                                fontSize: 10,
                                color: colors.onSurface.withOpacity(0.6),
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 6),

                      // AMENITIES
                      Row(
                        children: [
                          ...restaurant.amenities.take(2).map((amenity) {
                            IconData icon = Icons.wifi;
                            if (amenity.toLowerCase().contains('music')) {
                              icon = Icons.music_note;
                            }
                            return Expanded(
                              child: Row(
                                children: [
                                  Icon(
                                    icon,
                                    size: 10,
                                    color: colors.onSurface.withOpacity(0.6),
                                  ),
                                  const SizedBox(width: 2),
                                  Expanded(
                                    child: Text(
                                      amenity,
                                      style: TextStyle(
                                        fontSize: 9,
                                        color: colors.onSurface.withOpacity(
                                          0.6,
                                        ),
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
