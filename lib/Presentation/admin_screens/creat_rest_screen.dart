import 'package:flutter/material.dart';
import 'package:intershipflutter/Constans/models/restaurant%20detail%20models/restaurant_model.dart';
import 'package:intershipflutter/Constans/widgets/colors.dart';
import 'package:provider/provider.dart';
import 'package:intershipflutter/businessLogic/restaurant provider/restaurant_provider.dart';
import 'package:intershipflutter/businessLogic/Theme_Provider.dart';

class CreateRestaurantScreen extends StatefulWidget {
  const CreateRestaurantScreen({super.key});

  @override
  State<CreateRestaurantScreen> createState() => _CreateRestaurantScreenState();
}

class _CreateRestaurantScreenState extends State<CreateRestaurantScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController aboutController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  bool isEditing = true;

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();
    final colors = themeProvider.isDark ? AppColors.dark : AppColors.light;

    return Scaffold(
      backgroundColor: colors.backgroundColor,
      appBar: AppBar(
        title: Text("Create"),
        centerTitle: true,
        backgroundColor: colors.primary,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: colors.primary,
        onPressed: () {
          final restaurantProvider = context.read<RestaurantProvider>();

          restaurantProvider.restaurants.add(
            RestaurantModel(
              id: DateTime.now().toString(),
              name: nameController.text,
              cuisine: "Unknown",
              address: "No Address",
              phone: phoneController.text,
              email: emailController.text,
              openingHours: "N/A",
              rating: 0,
              reviewCount: 0,
              discount: "",
              images: [],
              about: aboutController.text,
              socialMedia: [],
              location: "",
              amenities: [],
            ),
          );

          Navigator.pop(context);
        },
        child: const Icon(Icons.save),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: ListView(
          children: [
            // -------- Photo Add Area ----------
            GestureDetector(
              onTap: () {},
              child: Container(
                height: 130,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: colors.primary),
                  color: Colors.white,
                ),
                child: const Center(
                  child: Icon(Icons.add_a_photo, size: 40, color: Colors.grey),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // --------- Name ----------
            const Text("Name", style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 6),
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // --------- About ----------
            const Text("About", style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 6),
            TextField(
              controller: aboutController,
              maxLines: 5,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // --------- Phone ----------
            const Text("Phone", style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 6),
            TextField(
              controller: phoneController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // --------- Email ----------
            const Text("Email", style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 6),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
