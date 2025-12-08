import 'package:flutter/material.dart';
import 'package:intershipflutter/Presentation/Screens/my%20orders/my_orders.dart';
import 'package:intershipflutter/Presentation/Screens/profile%20menu%20screen/profile_menu_screen.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:intershipflutter/Presentation/Screens/favourite%20screen/favourite_screen.dart';
import 'package:intershipflutter/Presentation/Screens/home%20screen/home_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PersistentTabController controller = PersistentTabController(
    initialIndex: 0,
  );

  List<Widget> screens() => const [
        HomeScreen(),
        FavouriteScreen(),
        MyOrders(),
        ProfileMenuScreen(),
      ];

  List<PersistentBottomNavBarItem> navItems(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.home),
        activeColorPrimary: colors.primary,
        inactiveColorPrimary: colors.onSurface.withOpacity(0.5),
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.favorite_border),
        activeColorPrimary: colors.primary,
        inactiveColorPrimary: colors.onSurface.withOpacity(0.5),
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.download_done_outlined),
        activeColorPrimary: colors.primary,
        inactiveColorPrimary: colors.onSurface.withOpacity(0.5),
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.person),
        activeColorPrimary: colors.primary,
        inactiveColorPrimary: colors.onSurface.withOpacity(0.5),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return PersistentTabView(
      context,
      controller: controller,
      screens: screens(),
      items: navItems(context),
      backgroundColor: colors.surface, // adaptive navbar background
      navBarStyle: NavBarStyle.style8,
    );
  }
}