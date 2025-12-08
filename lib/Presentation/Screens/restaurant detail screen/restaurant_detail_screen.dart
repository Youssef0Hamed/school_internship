import 'package:flutter/material.dart';
import 'package:intershipflutter/Constans/models/restaurant%20detail%20models/review_model.dart';
import 'package:intershipflutter/Constans/widgets/restaurant%20detail%20tabs/about_tab.dart';
import 'package:intershipflutter/Constans/widgets/restaurant%20detail%20tabs/menu_tab.dart';
import 'package:intershipflutter/Constans/widgets/restaurant%20detail%20tabs/reviews_tab.dart';
import 'package:intershipflutter/businessLogic/restaurant%20provider/restaurant_provider.dart';
import 'package:provider/provider.dart';

class RestaurantDetailScreen extends StatefulWidget {
  final String restaurantId;
  const RestaurantDetailScreen({Key? key, required this.restaurantId})
      : super(key: key);

  @override
  State<RestaurantDetailScreen> createState() => _RestaurantDetailScreenState();
}

class _RestaurantDetailScreenState extends State<RestaurantDetailScreen>
    with SingleTickerProviderStateMixin {
  late PageController _pageController;
  int _currentImage = 0;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _pageController = PageController();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Scaffold(
      body: Consumer<RestaurantProvider>(
        builder: (context, provider, _) {
          if (provider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (provider.error != null) {
            return Center(
                child: Text(
              'Error: ${provider.error}',
              style: TextStyle(color: colors.error),
            ));
          }

          final restaurant = provider.restaurants.firstWhere(
            (r) => r.id == widget.restaurantId,
            orElse: () => provider.restaurants.first,
          );

          return CustomScrollView(
            slivers: [
              // ---------------- Restaurant Image Header ----------------
              SliverAppBar(
                expandedHeight: 280,
                pinned: true,
                backgroundColor: colors.background,
                elevation: 0,
                leading: Container(
                  margin: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: colors.surface,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: colors.shadow.withOpacity(0.2),
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      )
                    ],
                  ),
                  child: IconButton(
                    icon: Icon(Icons.arrow_back, color: colors.onBackground),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
                actions: [
                  Container(
                    margin: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: colors.surface,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: colors.shadow.withOpacity(0.2),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        )
                      ],
                    ),
                    child: IconButton(
                      icon: Icon(
                        restaurant.isFavorite
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: Colors.redAccent,
                      ),
                      onPressed: () => provider.toggleFavorite(restaurant.id),
                    ),
                  ),
                ],
                flexibleSpace: FlexibleSpaceBar(
                  background: Stack(
                    fit: StackFit.expand,
                    children: [
                      PageView.builder(
                        controller: _pageController,
                        itemCount: restaurant.images.length,
                        onPageChanged: (index) {
                          setState(() => _currentImage = index);
                        },
                        itemBuilder: (_, index) {
                          return Image.network(
                            restaurant.images[index],
                            fit: BoxFit.cover,
                          );
                        },
                      ),
                      Positioned(
                        bottom: 16,
                        left: 0,
                        right: 0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            restaurant.images.length,
                            (index) => AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              width: _currentImage == index ? 22 : 8,
                              height: 8,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 4),
                              decoration: BoxDecoration(
                                color: _currentImage == index
                                    ? colors.onBackground
                                    : colors.onBackground.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // ---------------- Restaurant Info ----------------
              SliverToBoxAdapter(
                child: Container(
                  color: colors.background,
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Discount and rating
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 6),
                            decoration: BoxDecoration(
                              color: colors.secondary.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              restaurant.discount,
                              style: TextStyle(
                                color: colors.secondary,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 6),
                            decoration: BoxDecoration(
                              color: colors.primary,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(
                              children: [
                                const Icon(Icons.star,
                                    color: Colors.amber, size: 16),
                                const SizedBox(width: 4),
                                Text(
                                  '${restaurant.rating} (${restaurant.reviewCount} reviews)',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      // Name
                      Text(
                        restaurant.name,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: colors.onBackground,
                        ),
                      ),
                      const SizedBox(height: 12),
                      // Cuisine
                      Row(
                        children: [
                          Icon(Icons.restaurant,
                              size: 16, color: colors.onBackground.withOpacity(0.6)),
                          const SizedBox(width: 8),
                          Text(
                            restaurant.cuisine,
                            style: TextStyle(
                              color: colors.onBackground.withOpacity(0.6),
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      // Address
                      Row(
                        children: [
                          Icon(Icons.location_on,
                              size: 16, color: colors.onBackground.withOpacity(0.6)),
                          const SizedBox(width: 8),
                          Text(
                            restaurant.address,
                            style: TextStyle(
                              color: colors.onBackground.withOpacity(0.6),
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      // Opening hours
                      Row(
                        children: [
                          Icon(Icons.access_time,
                              size: 16, color: colors.onBackground.withOpacity(0.6)),
                          const SizedBox(width: 8),
                          Text(
                            restaurant.openingHours,
                            style: TextStyle(
                              color: colors.onBackground.withOpacity(0.6),
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              // ---------------- Tab Bar ----------------
              SliverAppBar(
                pinned: true,
                toolbarHeight: 0,
                backgroundColor: colors.background,
                bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(48),
                  child: TabBar(
                    controller: _tabController,
                    indicatorColor: colors.primary,
                    labelColor: colors.primary,
                    unselectedLabelColor: colors.onBackground.withOpacity(0.6),
                    tabs: const [
                      Tab(text: 'Menu'),
                      Tab(text: 'About'),
                      Tab(text: 'Reviews'),
                    ],
                  ),
                ),
              ),

              // ---------------- Tab Content ----------------
              SliverFillRemaining(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    MenuTab(menuItems: provider.menuItems),
                    AboutTab(restaurant: restaurant),
                    ReviewsTab(
                      reviews: provider.reviews,
                      onAddReview: (Review review) {
                        provider.addReview(review);
                      },
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),

      // ---------------- Book Now Button ----------------
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: colors.primary,
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Text(
            'Book now',
            style: TextStyle(
              color: colors.onPrimary,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}