import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:intershipflutter/businessLogic/home%20provideres/restaurant_provider.dart';



class PopularRestaurants extends StatefulWidget {
  final List<RestaurantModel> restaurants;
  final Function(String)? onRestaurantTap;
  final Function(String)? onToggleFavorite;
  final VoidCallback? onSeeAll;

  const PopularRestaurants({
    Key? key,
    required this.restaurants,
    this.onRestaurantTap,
    this.onToggleFavorite,
    this.onSeeAll,
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
      final index =
          _restaurants.indexWhere((r) => r.id == restaurantId);
      if (index != -1) {
        _restaurants[index].isFavorite = !_restaurants[index].isFavorite;
      }
    });
    widget.onToggleFavorite?.call(restaurantId);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Header
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Popular restaurants',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              GestureDetector(
                onTap: widget.onSeeAll,
                child: Row(
                  children: const [
                    Text(
                      'See all',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF0D7377),
                      ),
                    ),
                    SizedBox(width: 4),
                    Icon(
                      Icons.chevron_right,
                      color: Color(0xFF0D7377),
                      size: 18,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        // Filter Tabs
        SizedBox(
          height: 40,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            children: [
              _buildFilterButton('great-offers', 'Great offers'),
              _buildFilterButton('newest', 'Newest'),
              _buildFilterButton('rating', 'Rating 4.5+'),
            ],
          ),
        ),
        const SizedBox(height: 16),
        // Restaurants Grid
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.85,
            crossAxisSpacing: 12,
            mainAxisSpacing: 16,
          ),
          itemCount: _restaurants.length,
          itemBuilder: (context, index) {
            final restaurant = _restaurants[index];
            return _buildRestaurantCard(restaurant);
          },
        ),
      ],
    );
  }

  Widget _buildFilterButton(String filterId, String label) {
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
          backgroundColor: isActive
              ? const Color(0xFF0D7377)
              : Colors.transparent,
          foregroundColor: isActive
              ? Colors.white
              : const Color(0xFF0D7377),
          side: BorderSide(
            color: const Color(0xFF0D7377),
            width: 2,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 12,
          ),
        ),
      ),
    );
  }

  Widget _buildRestaurantCard(RestaurantModel restaurant) {
    return GestureDetector(
      onTap: () => widget.onRestaurantTap?.call(restaurant.id),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                  child: CachedNetworkImage(
                    imageUrl: restaurant.image,
                    height: 140,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Container(
                      color: Colors.grey[200],
                      child: const Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                    errorWidget: (context, url, error) => Container(
                      color: Colors.grey[200],
                      child: const Icon(Icons.error),
                    ),
                  ),
                ),
                // Favorite Button
                Positioned(
                  top: 8,
                  right: 8,
                  child: GestureDetector(
                    onTap: () => _toggleFavorite(restaurant.id),
                    child: Container(
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
                      padding: const EdgeInsets.all(6),
                      child: Icon(
                        restaurant.isFavorite
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: restaurant.isFavorite
                            ? Colors.red
                            : Colors.grey,
                        size: 18,
                      ),
                    ),
                  ),
                ),
                // Rating Badge
                Positioned(
                  bottom: 8,
                  right: 8,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
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
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            color: Colors.black87,
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
            // Content
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    restaurant.name,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on,
                        size: 12,
                        color: Colors.grey,
                      ),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          restaurant.location,
                          style: const TextStyle(
                            fontSize: 10,
                            color: Colors.grey,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
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
                                color: Colors.grey,
                              ),
                              const SizedBox(width: 2),
                              Expanded(
                                child: Text(
                                  amenity,
                                  style: const TextStyle(
                                    fontSize: 9,
                                    color: Colors.grey,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}