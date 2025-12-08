import 'package:flutter/material.dart';
import 'package:intershipflutter/Constans/widgets/profile info widgets/profile_header.dart';
import 'package:intershipflutter/Constans/widgets/profile%20info%20widgets/menu_item_card.dart.dart';
import 'package:intershipflutter/Presentation/Screens/profile menu screen/Personal_Info_Screen.dart';
import 'package:intershipflutter/Presentation/Screens/settings%20screen/settings_screen.dart';
import 'package:intershipflutter/Presentation/login_screens/login screens/Login.dart';
import 'package:intershipflutter/businessLogic/user provider/user_provider.dart';
import 'package:provider/provider.dart';

class ProfileMenuScreen extends StatelessWidget {
  const ProfileMenuScreen({Key? key}) : super(key: key);

  void _navigateToPersonalInfo(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const PersonalInfoScreen()),
    );
  }

  void _showComingSoonSnackbar(BuildContext context, String feature) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$feature is coming soon!'),
        backgroundColor: const Color(0xFF1B7B7A),
        duration: const Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Logout'),
        content: const Text('Are you sure you want to logout?'),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: const Text('Logged out successfully'),
                  backgroundColor: Colors.green[600],
                  duration: const Duration(seconds: 2),
                  behavior: SnackBarBehavior.floating,
                  margin: const EdgeInsets.all(16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              );
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LoginScreen()),
              );
            },
            child: const Text(
              'Logout',
              style: TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: Consumer<UserProvider>(
        builder: (context, userProvider, child) {
          return SingleChildScrollView(
            child: Column(
              children: [
                ProfileHeader(
                  userName: userProvider.user.fullName,
                  profileImageUrl: userProvider.user.profileImageUrl,
                  showEditButton: true,
                  onEditPressed: () => _navigateToPersonalInfo(context),
                ),
                const SizedBox(height: 16),
                MenuItemCard(
                  title: 'Personal information',
                  icon: Icons.person,
                  iconColor: const Color(0xFF1B7B7A),
                  onTap: () => _navigateToPersonalInfo(context),
                ),
                MenuItemCard(
                  title: 'Payments',
                  icon: Icons.credit_card,
                  iconColor: const Color(0xFF1B7B7A),
                  onTap: () => _showComingSoonSnackbar(context, 'Payments'),
                ),
                MenuItemCard(
                  title: 'My reviews',
                  icon: Icons.star,
                  iconColor: const Color(0xFF1B7B7A),
                  onTap: () => _showComingSoonSnackbar(context, 'My reviews'),
                ),
                MenuItemCard(
                  title: 'Awards and promocodes',
                  icon: Icons.card_giftcard,
                  iconColor: const Color(0xFF1B7B7A),
                  onTap: () => _showComingSoonSnackbar(
                    context,
                    'Awards and promocodes',
                  ),
                ),
                MenuItemCard(
                  title: 'Settings',
                  icon: Icons.settings,
                  iconColor: const Color(0xFF1B7B7A),
                  onTap: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => const SettingsScreen(),
                      ),
                    );
                  },
                ),
                MenuItemCard(
                  title: 'Support',
                  icon: Icons.help_outline,
                  iconColor: const Color(0xFF1B7B7A),
                  onTap: () => _showComingSoonSnackbar(context, 'Support'),
                ),
                MenuItemCard(
                  title: 'Log out',
                  icon: Icons.logout,
                  iconColor: Colors.red[600] ?? Colors.red,
                  isDestructive: true,
                  onTap: () => _showLogoutDialog(context),
                ),
                const SizedBox(height: 32),
              ],
            ),
          );
        },
      ),
    );
  }
}