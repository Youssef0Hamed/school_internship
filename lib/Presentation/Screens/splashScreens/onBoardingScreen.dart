import 'package:flutter/material.dart';
import 'package:intershipflutter/Presentation/Screens/splashScreens/reusebleScreen.dart';
import 'package:intershipflutter/businessLogic/InicatorProvider.dart';
import 'package:provider/provider.dart';

class onBoardingScreen extends StatefulWidget {
   onBoardingScreen({super.key});

  @override
  State<
    onBoardingScreen
  > createState() => _SecoundscreenState();
}

class _SecoundscreenState extends State<onBoardingScreen> {
  final PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
      final provider = Provider.of<Inicatorprovider>(context);
    return Scaffold(
      body: Column(
        children: [
          Expanded(child: PageView(
            controller: _pageController,
            onPageChanged: provider.changeScreens,
            children: [
               OnBoardingItem(
                  imagePath: "assets/table.png",
                  title: "Your Food Adventure Awaits",
                  subtitle: "Your next favorite meal is waiting",
                  pageController: _pageController,
                ),
               OnBoardingItem(
                  imagePath: "assets/dish.png",
                  title: "Explore Local Flavors ",
                  subtitle: "Find hidden gems in your city.",
                  pageController: _pageController,
                ),
               OnBoardingItem(
                  imagePath: "assets/coins.png",
                  title: "Dine and Earn ",
                  subtitle: "Every time you make a reservation you'll earn bonus points.",
                  pageController: _pageController,
                  isLast: true,
                ),
            ],
          ))
        ],
      ),
    );
  }
}