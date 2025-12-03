import 'package:flutter/material.dart';

class FavouriteResturantName extends StatelessWidget {
  final String name;

  const FavouriteResturantName(this.name, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.black),
      ),
      child: Text("$name"),
    );
  }
}
