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

  /// ----- Your Screens -----
  List<Widget> screens() => [
    const HomeScreen(),
    Favourite_screen(),
    const MyOrders(),
    const ProfileMenuScreen(),
  ];

  /// ----- Navigation Items -----
  List<PersistentBottomNavBarItem> navItems() => [
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.home),

      activeColorPrimary: Colors.blue,
      inactiveColorPrimary: Colors.grey,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.favorite_border),

      activeColorPrimary: Colors.blue,
      inactiveColorPrimary: Colors.grey,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.download_done_outlined),

      activeColorPrimary: Colors.blue,
      inactiveColorPrimary: Colors.grey,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.person),

      activeColorPrimary: Colors.blue,
      inactiveColorPrimary: Colors.grey,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: controller,
      screens: screens(),
      items: navItems(),
      backgroundColor: Colors.white,
      navBarStyle: NavBarStyle.style8, // clean simple navbar
    );
  }
}
