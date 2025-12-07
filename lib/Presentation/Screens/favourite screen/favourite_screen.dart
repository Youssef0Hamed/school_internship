import 'package:flutter/material.dart';
import 'package:intershipflutter/Constans/widgets/colors.dart';
import 'package:intershipflutter/Constans/widgets/favourite%20card%20widget/favourite_card_widget.dart';
import 'package:intershipflutter/Constans/models/favouriteCardModel.dart';

// ---------------------------------------------------------
//  Favourite Restaurant Name Widget
// ---------------------------------------------------------
class FavouriteResturant extends StatelessWidget {
  final String name;

  const FavouriteResturant(this.name, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.black),
      ),
      child: Text(name),
    );
  }
}

// ---------------------------------------------------------
//  Favourite Screen
// ---------------------------------------------------------
class Favourite_screen extends StatelessWidget {
  Favourite_screen({super.key});

  final List<Favouritecardmodel> data = [
    Favouritecardmodel(
      imageUrl: "assets/e09fb6628eac6a0ab1526b10543ab47ff30bfbef.jpg",
      discount: 10,
      title: "Taco",
      rate: 4.3,
    ),
    Favouritecardmodel(
      imageUrl: "assets/e09fb6628eac6a0ab1526b10543ab47ff30bfbef.jpg",
      discount: 10,
      title: "Taco",
      rate: 4.3,
    ),
    Favouritecardmodel(
      imageUrl: "assets/e09fb6628eac6a0ab1526b10543ab47ff30bfbef.jpg",
      discount: 10,
      title: "Taco",
      rate: 4.3,
    ),
  ];

  final List<String> name = [
    "All",
    "Italian",
    "Mexican",
    "Asian",
    "vegetarian",
    "Egyptian",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Favourites",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: Icon(Icons.arrow_back, color: mainColors().primary),
      ),
      backgroundColor: Colors.white,

      body: SingleChildScrollView(
        child: Column(
          children: [
            // Category chips
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: SizedBox(
                height: 53,
                child: ListView.builder(
                  itemCount: name.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, i) {
                    return Padding(
                      padding: const EdgeInsets.all(10),
                      child: FavouriteResturant(name[i]),
                    );
                  },
                ),
              ),
            ),

            // Favourite Cards List
            ListView.builder(
              itemCount: data.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (_, i) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 30,
                  ),
                  child: FavouriteCard(model: data[i]),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}