import 'package:flutter/material.dart';
import 'package:intershipflutter/businessLogic/home%20provideres/cuisine_provider.dart';


class CuisinesSection extends StatefulWidget {
  final List<CuisineModel> cuisines;
  final Function(String)? onCuisineSelected;
  final VoidCallback? onSeeAll;

  const CuisinesSection({
    super.key,
    required this.cuisines,
    this.onCuisineSelected,
    this.onSeeAll,
  });

  @override
  State<CuisinesSection> createState() => _CuisinesSectionState();
}

class _CuisinesSectionState extends State<CuisinesSection> {
  late List<CuisineModel> _cuisines;

  @override
  void initState() {
    super.initState();
    _cuisines = List.from(widget.cuisines);
  }

  void _selectCuisine(String cuisineId) {
    setState(() {
      for (var cuisine in _cuisines) {
        cuisine.isActive = cuisine.id == cuisineId;
      }
    });
    widget.onCuisineSelected?.call(cuisineId);
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
                'Cuisines',
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
        // Cuisines List
        SizedBox(
          height: 120,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            itemCount: _cuisines.length,
            itemBuilder: (context, index) {
              final cuisine = _cuisines[index];
              return _buildCuisineItem(cuisine);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildCuisineItem(CuisineModel cuisine) {
    return GestureDetector(
      onTap: () => _selectCuisine(cuisine.id),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        width: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: cuisine.isActive
                ? const Color(0xFF0D7377)
                : Colors.transparent,
            width: 2,
          ),
          color: cuisine.isActive ? Colors.white : Colors.grey[100],
          boxShadow: cuisine.isActive
              ? [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ]
              : [],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              cuisine.icon,
              style: const TextStyle(fontSize: 40),
            ),
            const SizedBox(height: 8),
            Text(
              cuisine.name,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Colors.grey[800],
              ),
            ),
          ],
        ),
      ),
    );
  }
}