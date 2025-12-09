import 'package:flutter/material.dart';
import 'package:intershipflutter/Constans/widgets/profile info widgets/profile_header.dart';
import 'package:intershipflutter/Constans/widgets/profile%20info%20widgets/menu_item_card.dart.dart';
import 'package:intershipflutter/Presentation/Screens/about_us_screen/about_us_screen.dart';
import 'package:intershipflutter/Presentation/Screens/profile menu screen/Personal_Info_Screen.dart';
import 'package:intershipflutter/Presentation/Screens/settings%20screen/settings_screen.dart';
import 'package:intershipflutter/Presentation/login_screens/login%20screen/Login.dart';
import 'package:intershipflutter/businessLogic/user provider/user_provider.dart';
import 'package:provider/provider.dart';

class ProfileMenuScreen extends StatelessWidget {
  const ProfileMenuScreen({Key? key}) : super(key: key);

  void _navigateToPersonalInfo(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => const PersonalInfoScreen()),
    );
  }

  void _showComingSoonSnackbar(BuildContext context, String feature) {
    final theme = Theme.of(context);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          '$feature is coming soon!',
          style: TextStyle(color: theme.colorScheme.onPrimary),
        ),
        backgroundColor: theme.primaryColor,
        duration: const Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    final theme = Theme.of(context);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Logout',
            style: TextStyle(color: theme.textTheme.titleLarge!.color)),
        content: Text('Are you sure you want to logout?',
            style: TextStyle(color: theme.textTheme.bodyMedium!.color)),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel', style: TextStyle(color: theme.primaryColor)),
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
                      borderRadius: BorderRadius.circular(12)),
                ),
              );
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const LoginScreen()),
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
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
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
                  iconColor: theme.colorScheme.primary,
                  onTap: () => _navigateToPersonalInfo(context),
                ),
                MenuItemCard(
                  title: 'Payments',
                  icon: Icons.credit_card,
                  iconColor: theme.colorScheme.primary,
                  onTap: () => _showComingSoonSnackbar(context, 'Payments'),
                ),
                MenuItemCard(
                  title: 'My reviews',
                  icon: Icons.star,
                  iconColor: theme.colorScheme.primary,
                  onTap: () => _showComingSoonSnackbar(context, 'My reviews'),
                ),
                MenuItemCard(
                  title: 'Awards and promocodes',
                  icon: Icons.card_giftcard,
                  iconColor: theme.colorScheme.primary,
                  onTap: () =>
                      _showComingSoonSnackbar(context, 'Awards and promocodes'),
                ),
                MenuItemCard(
                  title: 'Settings',
                  icon: Icons.settings,
                  iconColor: theme.colorScheme.primary,
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => const SettingsScreen()),
                    );
                  },
                ),
                MenuItemCard(
                  title: 'About Us',
                  icon: Icons.help_outline,
                  iconColor: theme.colorScheme.primary,
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => const AboutUsScreen()),
                    );
                  },
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
