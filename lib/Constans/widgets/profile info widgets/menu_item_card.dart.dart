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

  void _onTapDown(TapDownDetails details) {
    _animationController.forward();
  }

  void _onTapUp(TapUpDetails details) {
    _animationController.reverse();
    widget.onTap();
  }

  void _onTapCancel() {
    _animationController.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTapCancel: _onTapCancel,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.08),
                blurRadius: 12,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: widget.iconColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.all(12),
                  child: Icon(
                    widget.icon,
                    color: widget.isDestructive
                        ? Colors.red[600]
                        : widget.iconColor,
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
                      color: widget.isDestructive
                          ? Colors.red[600]
                          : Colors.black87,
                      letterSpacing: 0.3,
                    ),
                  ),
                ),
                Icon(
                  Icons.chevron_right,
                  color: widget.isDestructive
                      ? Colors.red[400]
                      : const Color(0xFF1B7B7A),
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