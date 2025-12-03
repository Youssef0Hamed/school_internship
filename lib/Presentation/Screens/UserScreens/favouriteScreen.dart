import 'package:flutter/material.dart';
import 'package:intershipflutter/Constans/colors.dart';
import 'package:intershipflutter/Presentation/widgets/favourite_screen/favourite_card_widget.dart';
import 'package:intershipflutter/Presentation/widgets/favourite_screen/favourite_resturant_name.dart';
import 'package:intershipflutter/businessLogic/home%20provideres/favouriteCardModel.dart';

class Favouritescreen extends StatelessWidget {
  Favouritescreen({super.key});

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
        title: Text(
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
                      padding: EdgeInsetsGeometry.all(10),
                      child: FavouriteResturantName(name[i]),
                    );
                  },
                ),
              ),
            ),
            ListView.builder(
              itemCount: data.length,
              shrinkWrap: true,
              itemBuilder: (_, i) {
                return Padding(
                  padding: EdgeInsetsGeometry.symmetric(
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
