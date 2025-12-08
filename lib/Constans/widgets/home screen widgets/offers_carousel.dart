import 'package:flutter/material.dart';
import 'package:intershipflutter/Constans/models/home%20models/offer_model.dart';
import 'package:provider/provider.dart';
import 'package:intershipflutter/businessLogic/Theme_Provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OffersCarousel extends StatefulWidget {
  final List<OfferModel> offers;
  final VoidCallback? onBookNow;

  const OffersCarousel({
    super.key,
    required this.offers,
    this.onBookNow,
  });

  @override
  State<OffersCarousel> createState() => OffersCarouselState();
}

class OffersCarouselState extends State<OffersCarousel> {
  late PageController _pageController;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    WidgetsBinding.instance.addPostFrameCallback((_) => _startAutoScroll());
  }

  void _startAutoScroll() {
    Future.doWhile(() async {
      await Future.delayed(const Duration(seconds: 3));
      if (!mounted) return false;

      int next = _currentIndex + 1;
      if (next >= widget.offers.length) next = 0;

      _pageController.animateToPage(
        next,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );

      return true;
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        final theme = Theme.of(context);
        final colors = theme.colorScheme;

        return Column(
          children: [
            SizedBox(
              height: 170,
              child: PageView.builder(
                controller: _pageController,
                itemCount: widget.offers.length,
                onPageChanged: (i) =>
                    setState(() => _currentIndex = i),
                itemBuilder: (_, i) =>
                    _buildOfferCard(widget.offers[i], colors),
              ),
            ),
            const SizedBox(height: 12),

            /// Indicator
            SmoothPageIndicator(
              controller: _pageController,
              count: widget.offers.length,
              effect: ExpandingDotsEffect(
                dotColor: colors.onSurface.withOpacity(0.3),
                activeDotColor: colors.primary,
                dotHeight: 8,
                dotWidth: 8,
                spacing: 8,
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildOfferCard(OfferModel offer, ColorScheme colors) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: colors.surface,
        border: Border.all(
          color: colors.primary,
          width: 2,
        ),
        boxShadow: [
          BoxShadow(
            color: colors.primary.withOpacity(0.2),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            right: -30,
            top: -20,
            child: Container(
              width: 180,
              height: 220,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage('assets/offers.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(14),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                    children: [
                      /// TITLE & SUBTITLE
                      Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,
                        children: [
                          Text(
                            offer.title,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: colors.onSurface,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            offer.subtitle,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: colors.onSurface,
                            ),
                          ),
                        ],
                      ),

                      /// DISCOUNT + BUTTON
                      Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                "UP TO ",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: colors.onSurface,
                                ),
                              ),
                              Text(
                                "${offer.discount}%",
                                style: TextStyle(
                                  fontSize: 35,
                                  fontWeight: FontWeight.bold,
                                  color: const Color(0xFFC9A66B), // highlight
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          ElevatedButton(
                            onPressed: widget.onBookNow,
                            child: Text(
                              offer.buttonText,
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                color: colors.onSurface,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}