import 'package:flutter/material.dart';

class MenuItemCard extends StatefulWidget {
  final String title;
  final IconData icon;
  final Color iconColor;
  final VoidCallback onTap;
  final bool isDestructive;

  const MenuItemCard({
    Key? key,
    required this.title,
    required this.icon,
    required this.iconColor,
    required this.onTap,
    this.isDestructive = false,
  }) : super(key: key);

  @override
  State<MenuItemCard> createState() => _MenuItemCardState();
}

class _MenuItemCardState extends State<MenuItemCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.98).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _onTapDown(TapDownDetails details) => _animationController.forward();

  void _onTapUp(TapUpDetails details) {
    _animationController.reverse();
    widget.onTap();
  }

  void _onTapCancel() => _animationController.reverse();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final textColor =
        widget.isDestructive ? Colors.red[600] : theme.textTheme.bodyLarge!.color;
    final chevronColor = widget.isDestructive ? Colors.red[400] : const Color(0xFF1B7B7A);

    return GestureDetector(
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTapCancel: _onTapCancel,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: colors.surface,
            borderRadius: BorderRadius.circular(16),
            // border: Border.all(
            //   color: colors.primary,
            //   width: 2,
            // ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey, // stronger shadow
                blurRadius: 1,
                spreadRadius: 0.5,
                offset: const Offset(1, 1),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: widget.iconColor.withOpacity(0.1),
                  ),
                  padding: const EdgeInsets.all(8),
                  child: Icon(
                    widget.icon,
                    color: textColor,
                    size: 24,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    widget.title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: textColor,
                      letterSpacing: 0.3,
                    ),
                  ),
                ),
                Icon(
                  Icons.chevron_right,
                  color: chevronColor,
                  size: 24,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}