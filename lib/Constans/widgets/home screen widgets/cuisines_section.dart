import 'package:flutter/material.dart';
import 'package:intershipflutter/Constans/models/home models/cuisine_model.dart';

class CuisinesSection extends StatefulWidget {
  final List<CuisineModel> cuisines;
  final Function(String)? onCuisineSelected;

  const CuisinesSection({
    super.key,
    required this.cuisines,
    this.onCuisineSelected,
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
    final colors = Theme.of(context).colorScheme;

    return Column(
      children: [
        // Header
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Cuisines',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: colors.onSurface,
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 12),

        // Cuisines List
        SizedBox(
          height: 85,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 14),
            itemCount: _cuisines.length,
            itemBuilder: (context, index) {
              final cuisine = _cuisines[index];
              return _buildCuisineItem(cuisine, colors);
            },
          ),
        ),
      ],
    );
  }
Widget _buildCuisineItem(CuisineModel cuisine, ColorScheme colors) {
  return GestureDetector(
    onTap: () => _selectCuisine(cuisine.id as String),
    child: Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      width: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: cuisine.isActive 
            ? colors.primary.withOpacity(0.2) // Active background color
            : Colors.grey.withOpacity(0.2),   // Inactive background color
        border: cuisine.isActive
            ? Border.all(
                color: colors.primary,
                width: 2,
              )
            : null, // No border when inactive
        boxShadow: cuisine.isActive
            ? [
                BoxShadow(
                  color: colors.primary.withOpacity(0.25),
                  blurRadius: 6,
                  offset: const Offset(0, 3),
                ),
              ]
            : [],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            cuisine.icon,
            style: TextStyle(
              fontSize: 40,
              color: colors.onSurface,
            ),
          ),
          Text(
            cuisine.name,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: colors.onSurface.withOpacity(0.8),
            ),
          ),
        ],
      ),
    ),
  );
}}